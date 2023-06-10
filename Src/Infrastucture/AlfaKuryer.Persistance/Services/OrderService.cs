using System;
using System.Linq.Expressions;
using AlfaKuryer.Application.Dtos.OrderDtos;
using AlfaKuryer.Application.Dtos.PriceDtos;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.IdentityServices;
using AlfaKuryer.Application.Services.OrderServices;
using AlfaKuryer.Application.Services.PaymentServices;
using AlfaKuryer.Application.Services.PriceService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Infrastucture.BackgorundJobs;
using AlfaKuryer.Infrastucture.ExtornerlServices;
using AlfaKuryer.Persistance.CustomExceptions;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace AlfaKuryer.Persistance.Services
{
	public class OrderService:IOrderService
	{
        private readonly IOrderReadRepository _orderRead;
        private readonly IOrderWriteRepository _orderWrite;
        private readonly IUserPaymentReadRepository _userPaymentRead;
        private readonly IUserPaymentWriteRepository _userPaymentWrite;
        private readonly ICourierBalanceReadRepository _balanceRead;
        private readonly ICourierBalanceWriteRepository _balanceWrite;
        private readonly ICassirBalanceReadRepository _cassirbalanceRead;
        private readonly ICassirBalanceWriteRepository _cassirbalanceWrite;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _http;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;
        private readonly IPriceService _priceService;
        private readonly IConfiguration _config;
        private readonly IPaymentService _payment;

        public OrderService(IOrderReadRepository orderRead, IOrderWriteRepository orderWrite, IMapper mapper, IHttpContextAccessor http, UserManager<ApplicationUser> userManager, ICityService cityService, IDistrictService districtService, IPriceService priceService, IConfiguration config, IUserPaymentReadRepository userPaymentRead, IUserPaymentWriteRepository userPaymentWrite, IPaymentService payment, ICourierBalanceReadRepository balanceRead, ICourierBalanceWriteRepository balanceWrite, ICassirBalanceReadRepository cassirbalanceRead, ICassirBalanceWriteRepository cassirbalanceWrite)
        {
            _orderRead = orderRead;
            _orderWrite = orderWrite;
            _mapper = mapper;
            _http = http;
            _userManager = userManager;
            _cityService = cityService;
            _districtService = districtService;
            _priceService = priceService;
            _config = config;
            _userPaymentRead = userPaymentRead;
            _userPaymentWrite = userPaymentWrite;
            _payment = payment;
            _balanceRead = balanceRead;
            _balanceWrite = balanceWrite;
            _cassirbalanceRead = cassirbalanceRead;
            _cassirbalanceWrite = cassirbalanceWrite;
        }
        public async Task Accept(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x=>x.Id==id,true,true,"Customer");
            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsAccepted == false)
            {
                order.IsAccepted = true;
                order.Courier = user;
             

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(()=>mail.Send(order.Customer.Email, $"{order.Id}-li sifarişə Kuryer təyin olundu"));
                }
                else
                {
                    SmsService smsService = new SmsService();
                    await MessageJob.SedMessage(()=>SmsService.Send($"{order.Id}-li sifarişə Kuryer təyin olundu", order.Customer.PhoneNumber));
                }
            }

        }
        public async Task Payed(int orderId)
        {
            var order = await _orderRead.GetAsync(x => x.Id == orderId, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsPaid = true;
          UserPayment userPayment=  await _userPaymentRead.GetAsync(x=>x.OrderNumber==orderId,true,false);
            userPayment.IsPay = true;
            await _userPaymentWrite.UpdateAsync(userPayment);
            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task<string> CreateOrder(OrderPostDto dto)
        {
            var userName = _http.HttpContext?.User.Identity?.Name;
            var user =await _userManager.FindByNameAsync(userName);

            if (!user.AccountIsCompleet)
            {
                return "acount not copleeted";
            }

            bool inCity = false;
       
            PriceGetDto priceGetDto = default;

            if (dto.OrderFromCityId == dto.OrderToCityId&&!dto.IsFast)
            {
                priceGetDto = await _priceService.Get(3);
                inCity = true;

            }else if(dto.OrderFromCityId != dto.OrderToCityId && dto.IsFast)
            {
                priceGetDto = await _priceService.Get(4);
                inCity = true;
            }
            else
            {
                priceGetDto = await _priceService.Get(5);

            }
            double Price;
            if (dto.Kq <= priceGetDto.UntilKq)
            {
                Price = priceGetDto.MinPrice;
            }
            else
            {
                int kqover=(int)Math.Ceiling(dto.Kq - priceGetDto.UntilKq);
                Price = priceGetDto.MinPrice;
                Price += kqover * priceGetDto.Price;
            }


            Order order = new Order
            {
                FromAdress = dto.FromAdress,
                CustomerId = user.Id,
                Customer = user,
                Kq = dto.Kq,
                OrderFromCityId = dto.OrderFromCityId,
                OrderToCityId = dto.OrderToCityId,
                ToAdress = dto.ToAdress,
                ToPhoneNumber = dto.ToPhoneNumber,
                Price = Price,
                IsInCity = inCity,
                ToFullname = dto.ToFullName,
                PackageCount = dto.PackageCount,
                IsCash = dto.Payment == "Cash" ? true : false,
                IsFast = dto.IsFast,
                IsPaid = false
            };

            order.OrderFromDistrictId = dto.OrderFromDistrictId != 0 ? dto.OrderFromDistrictId : null;
            order.OrderToDistrictId = dto.OrderToDistrictId != 0 ? dto.OrderToDistrictId : null;
            await _orderWrite.AddAsync(order);
            await _orderWrite.SaveAsync();
            if (!order.IsCash)
            {
               return await _payment.PayMent(order.Price,order.Id);
            }
            return "";
        }

        public async Task<string> CreateOrderInStorage(OrderPostDtoStorage dto)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            bool inCity = false;

            PriceGetDto priceGetDto = default;

    
                priceGetDto = await _priceService.Get(3);

            
            double Price;
            if (dto.Kq <= priceGetDto.UntilKq)
            {
                Price = priceGetDto.MinPrice;
            }
            else
            {
                int kqover = (int)Math.Ceiling(dto.Kq - priceGetDto.UntilKq);
                Price = priceGetDto.MinPrice;
                Price += kqover * priceGetDto.Price;
            }


            Order order = new Order
            {
                FromAdress = "Anbar",
                Kq = dto.Kq,
                OrderToCityId = dto.OrderToCityId,
                ToAdress = dto.ToAdress,
                ToPhoneNumber = dto.ToPhoneNumber,
                Price = Price,
                IsInCity = inCity,
                ToFullname = dto.ToFullName,
                PackageCount = dto.PackageCount,
                IsCash = dto.Payment == "Cash" ? true : false,
                IsFast = false,
                IsPaid = true,
                IsInStorage = true,
                IsAccepted = true,
                IsCourierOnRoad=true,
                IsCourierArriveForTake=true,
                FromFullName=dto.FromFullName,
                FromPhoneNumber=dto.FromPhoneNumber
            };
            
            
            order.OrderToDistrictId = dto.OrderToDistrictId != 0 ? dto.OrderToDistrictId : null;
            await _orderWrite.AddAsync(order);
       
            await _orderWrite.SaveAsync();
            await _cassirbalanceWrite.AddAsync(new CassirBalance
            {
                ApplicationUser = user,
                OrderNumber = order.Id,
                IsCash = order.IsCash,
                OrderPrice = order.Price,
                IsFast = order.IsFast
                
            });
            await _cassirbalanceWrite.SaveAsync();
            return "";
        }

        public async Task<OrderGetDto> Get(int id)
        {
            var order = await _orderRead.GetAsync(x => x.Id == id, true, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");

            if (order == null)
                throw new ItemNotFound("order not found");

            OrderGetDto orderGetDto = _mapper.Map<OrderGetDto>(order);
            return orderGetDto;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAll()
        {
            IQueryable<Order> ordersquery = ordersquery = await _orderRead.GetAllAsync(x =>(x.IsCash)||(!x.IsCash&&x.IsPaid), false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
            var orders = ordersquery.Select(x =>
                MapOrderToOrderGetDto(x)
            ); ;
            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllBy(string customerId=null,string couroerid=null)
        {
            IQueryable<Order> ordersquery=default;

            if (customerId != null)
                ordersquery = await _orderRead.GetAllAsync(x=>(x.CustomerId==customerId&&x.IsCash)||(x.CustomerId==customerId&&!x.IsCash && x.IsPaid),false,true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
            else if(couroerid!=null)
                ordersquery = await _orderRead.GetAllAsync(x => (x.CustomerId == customerId && x.IsCash) || (x.CustomerId == customerId && !x.IsCash && x.IsPaid), false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
          
            var orders =await ordersquery.Select(x=>
              MapOrderToOrderGetDto(x)
            ).ToListAsync();

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCustomer()
        {
            IQueryable<Order> ordersquery = default;
            var user =await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

                ordersquery = await _orderRead.GetAllAsync(x => (x.CustomerId == user.Id&&x.IsDelivered==false&&x.IsCash)|| (x.CustomerId == user.Id && x.IsDelivered == false && !x.IsCash&&x.IsPaid==true), false, true, "Customer", "Courier",
    "OrderFromCity",
    "OrderFromDistrict",
    "OrderToCity",
    "OrderToDistrict");

            var orders = await ordersquery.Select( x =>  MapOrderToOrderGetDto(x)).ToListAsync();

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCompany()
        {
            IQueryable<Order> ordersquery = default;
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

            ordersquery = await _orderRead.GetAllAsync(x => (x.CustomerId == user.Id), false, true, "Customer", "Courier",
"OrderFromCity",
"OrderFromDistrict",
"OrderToCity",
"OrderToDistrict");

            var orders = await ordersquery.Select(x => MapOrderToOrderGetDto(x)).ToListAsync();

            return orders;
        }
        public async Task<OrderGetDto> GetOrderById(int id)
        {
            var order = await _orderRead.GetAsync(x=>x.Id==id,false,true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict", "ForeignCourier");

            if (order == null)
                throw new ItemNotFound("order not found");

            OrderGetDto orderGet = MapOrderToOrderGetDto(order);
            return orderGet;

        }

        private static OrderGetDto MapOrderToOrderGetDto(Order order)
        {
            var orderGetDto = new OrderGetDto
            {
                Id = order.Id,
                Customer = order.Customer,
                Courier = order.Courier,
                ToPhoneNumber = order.ToPhoneNumber,
                ToAdress = order.ToAdress,
                FromAdress = order.FromAdress,
                OrderFromCity = order.OrderFromCity,
                OrderFromDistrict = order.OrderFromDistrict,
                OrderToCity = order.OrderToCity,
                OrderToDistrict = order.OrderToDistrict,
                Price = order.Price,
                Kq = order.Kq,
                PackageCount = order.PackageCount,
                IsInCity = order.IsInCity,
                IsAccepted = order.IsAccepted,
                IsCourierOnRoad = order.IsCourierOnRoad,
                IsCourierArriveForTake = order.IsCourierArriveForTake,
                IsCourierTaked = order.IsCourierTaked,
                IsInStorage = order.IsInStorage,
                IsOutStorage = order.IsOutStorage,
                IsOnroadToForeignCity = order.IsOnroadToForeignCity,
                IsInForeignCity = order.IsInForeignCity,
                IsOnRoad = order.IsOnRoad,
                IsCourierArrive = order.IsCourierArrive,
                IsDelivered = order.IsDelivered,
                ToFullName = order.ToFullname,
                CreatedDate = order.CreatedAt,
                ForeignCourier=order.ForeignCourier,
                IsForeignCourierAccepted = order.IsForeignCourierAccepted,
                IsCash = order.IsCash,
                IsFast = order.IsFast,
                
            };

            return orderGetDto;
        }

        public async Task<IEnumerable<OrderGetDto>> GetOrderForAccept()
        {
            var user = await _userManager.Users.Where(x => x.UserName == _http.HttpContext.User.Identity.Name).Include(x => x.ApplicationUserDistricts).FirstOrDefaultAsync();

            List<int?> Ids = new List<int?>();
            foreach (var item in user.ApplicationUserDistricts)
            {
                Ids.Add(item.DistrictId);
            }


            var queryOrder = await _orderRead.GetAllAsync(x =>(x.IsAccepted==false&&x.OrderFromCityId==user.CityId &&Ids.Contains(x.OrderFromDistrictId)&&x.IsCash)||
            (x.IsAccepted == false && x.OrderFromCityId == user.CityId && Ids.Contains(x.OrderFromDistrictId) && !x.IsCash&&x.IsPaid)
            ||
            (x.ForeignCourierId==null&&x.IsOutStorage==true&&x.OrderToCityId==user.CityId&&Ids.Contains(x.OrderToDistrictId)&&x.IsCash)||

                        (x.ForeignCourierId == null && x.IsOutStorage == true && x.OrderToCityId == user.CityId && Ids.Contains(x.OrderToDistrictId) && !x.IsCash&&x.IsPaid)
            , true, false, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
            var orders = await queryOrder.Select(x =>
              MapOrderToOrderGetDto(x)
           ).ToListAsync();
            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetOrderAccepted()
        {
            string userName = _http.HttpContext.User.Identity.Name;
            var user =await _userManager.FindByNameAsync(userName);
            var queryOrder = await _orderRead.GetAllAsync(x => (x.CourierId==user.Id&&x.IsInStorage==false)||(x.ForeignCourierId==user.Id&&x.IsDelivered==false), true, false, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict", "ForeignCourier");
            var orders = await queryOrder.Select(x => 
                MapOrderToOrderGetDto(x)
            ).ToListAsync();
            return orders;
        }
        public async Task CurierOnRoadForTake(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id&&x.CourierId==user.Id, true, true,"Customer");

            if (order == null)
                throw new ItemNotFound("order not found");


            if (order.IsCourierOnRoad == false)
            {
                order.IsCourierOnRoad = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Kuryer sizə tərəf yoldadır"));
                }
            }
       
        }
        public async Task CourierArriveForTake(int id)
        {

            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.CourierId == user.Id, true, true, "Customer");

            if (order == null)
                throw new ItemNotFound("order not found");


            if (order.IsCourierArriveForTake == false)
            {
                order.IsCourierArriveForTake = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Kuryer çatdı"));
                }
            }


        }

        public async Task CourierTaked(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.CourierId == user.Id, true, true, "Customer");

            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsCourierTaked == false)
            {
                await _balanceWrite.AddAsync(new CourierBalance
                {
                    ApplicationUser = user,
                    CouruyerSalary = order.IsFast ? (double)user.CourierSalaryForFast : (double)user.CourierSalaryForSimple,
                    OrderNumber = order.Id,
                    OrderPrice = order.Price,
                    IsCash = order.IsCash,
                    IsFast = order.IsFast
                });
                order.IsCourierTaked = true;
                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Kuryer təhvil aldı"));
                }
            }
        }

        public async Task InStorage(int id)
        {

            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.CourierId == user.Id, true, true, "Customer");

            if (order == null)
                throw new ItemNotFound("order not found");


            if (order.IsInStorage == false)
            {
                order.IsInStorage = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Sifarişiniz anbarda"));
                }
                else
                {
                    SmsService smsService = new SmsService();
                    await MessageJob.SedMessage(() => SmsService.Send($"Sifarişiniz anbarda", order.Customer.PhoneNumber));
                }
            }
        }
        public async Task AchiveForeignCity(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id, true, true, "Customer", "OrderToCity");

            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsInForeignCity == false)
            {
                order.IsInForeignCity = true;
                order.IsForeignCourierAccepted = true;
                    order.ForeignCourier = user;

                await _balanceWrite.AddAsync(new CourierBalance
                {
                    ApplicationUser = user,
                    CouruyerSalary = order.IsFast ? (double)user.CourierSalaryForFast : (double)user.CourierSalaryForSimple,
                    OrderNumber = order.Id,
                    OrderPrice = order.Price,
                    IsCash=order.IsCash,
                    IsFast=order.IsFast
                });

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer == null)
                {
                    SmsService smsService = new SmsService();
                    await MessageJob.SedMessage(() => SmsService.Send("çatdırılması üçün kuryer sifarişi təslim aldı", order.FromPhoneNumber));
                }
                else if (order.Customer.MessgaeBy == true)
                {
                    MailService mail = new MailService(_config);
                    await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, "çatdırılması üçün kuryer sifarişi təslim aldı"));
                }
                else
                {
                    SmsService smsService = new SmsService();
                    await MessageJob.SedMessage(() => SmsService.Send("çatdırılması üçün kuryer sifarişi təslim aldı", order.Customer.PhoneNumber));
                }
            }
        }
        public async Task OnRoad(int id)
        {

            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.ForeignCourierId == user.Id, true, true, "Customer", "OrderToCity");

            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsOnRoad == false)
            {
                order.IsOnRoad = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer != null)
                {
                    if (order.Customer.MessgaeBy == true)
                    {
                        MailService mail = new MailService(_config);
                        await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Sifarişiniz size teref gelir"));
                    }
                }
            }
        }

        public async Task CourierArrived(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.ForeignCourierId == user.Id, true, true, "Customer", "OrderToCity");

            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsCourierArrive == false)
            {
                order.IsCourierArrive = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer != null)
                {
                    if (order.Customer.MessgaeBy == true)
                    {
                        MailService mail = new MailService(_config);
                        await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, "Kuryer çatdı", order.Customer.Name));
                    }
                }
              
            
            }
        }

        public async Task Delivered(int id)
        {

            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x => x.Id == id && x.ForeignCourierId == user.Id, true, true, "Customer", "OrderToCity");

            if (order == null)
                throw new ItemNotFound("order not found");

            if (order.IsDelivered == false)
            {
                order.IsDelivered = true;

                await _orderWrite.UpdateAsync(order);
                await _orderWrite.SaveAsync();

                if (order.Customer != null)
                {
                    if (order.Customer!=null)
                    {
                        MailService mail = new MailService(_config);
                        await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, "Sifariş tamamlandi"));
                    }
                }
                 

            }
        }

        public async Task<IEnumerable<OrderGetDto>> GetInStorage()
        {
            IQueryable<Order> ordersquery = ordersquery = await _orderRead.GetAllAsync(x => !x.IsDeleted&&x.IsInStorage==true&&x.IsOutStorage==false, false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");


            var orders = ordersquery.Select(x => new OrderGetDto
            {
                Courier = x.Courier,
                Customer = x.Customer,
                FromAdress = x.FromAdress,
                IsAccepted = x.IsAccepted,
                IsInStorage = x.IsInStorage,
                IsOutStorage = x.IsOutStorage,
                IsCourierArrive = x.IsCourierArrive,
                IsCourierArriveForTake = x.IsCourierArriveForTake,
                IsCourierOnRoad = x.IsCourierOnRoad,
                IsCourierTaked = x.IsCourierTaked,
                IsDelivered = x.IsDelivered,
                IsInCity = x.IsInCity,
                IsInForeignCity = x.IsInForeignCity,
                IsOnRoad = x.IsOnRoad,
                IsOnroadToForeignCity = x.IsOnroadToForeignCity,
                Kq = x.Kq,
                OrderFromCity = x.OrderFromCity,
                OrderFromDistrict = x.OrderFromDistrict,
                OrderToCity = x.OrderToCity,
                OrderToDistrict = x.OrderToDistrict,
                PackageCount = x.PackageCount,
                Price = x.Price,
                ToAdress = x.ToAdress,
                ToPhoneNumber = x.ToPhoneNumber,
                Id = x.Id,
                ToFullName = x.ToFullname,
                IsForeignCourierAccepted = x.IsForeignCourierAccepted,
                IsCash = x.IsCash,
                IsFast = x.IsFast,
            });
            return orders;
        }

        public async Task OutStorage(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true, "Customer");

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsOutStorage = true;
            order.IsOnroadToForeignCity = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();

            if (order.Customer == null)
            {
                SmsService smsService = new SmsService();
                await MessageJob.SedMessage(() => SmsService.Send($"Sifaris anbardan çıxdı sizin isdiqamətdə yoldadır", order.FromPhoneNumber));
            }
            else if (order.Customer.MessgaeBy == true)
            {
                MailService mail = new MailService(_config);
                await MessageJob.SedMessage(() => mail.Send(order.Customer.Email, $"Sifaris anbardan çıxdı sizin isdiqamətdə yoldadır"));
            }
            else
            {
                SmsService smsService = new SmsService();
                await MessageJob.SedMessage(() => SmsService.Send($"Sifaris anbardan çıxdı sizin isdiqamətdə yoldadır", order.Customer.PhoneNumber));
            }
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCustomerHistory(int page)
        {
            IQueryable<Order> ordersquery = default;
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

            ordersquery = await _orderRead.GetAllAsync(x => x.CustomerId == user.Id && x.IsDelivered == true, false, true, "Customer", "Courier",
"OrderFromCity",
"OrderFromDistrict",
"OrderToCity",
"OrderToDistrict");
            int Maxnum = ordersquery.Count();
            ordersquery = ordersquery.OrderByDescending(x => x.Id);
            ordersquery = ordersquery.Skip((page - 1) * 10).Take(10);
            var orders = await ordersquery.Select(x => new OrderGetDto
            {
                Id = x.Id,
                Courier = x.Courier,
                Customer = x.Customer,
                FromAdress = x.FromAdress,
                IsAccepted = x.IsAccepted,
                IsInStorage = x.IsInStorage,
                IsOutStorage = x.IsOutStorage,
                IsCourierArrive = x.IsCourierArrive,
                IsCourierArriveForTake = x.IsCourierArriveForTake,
                IsCourierOnRoad = x.IsCourierOnRoad,
                IsCourierTaked = x.IsCourierTaked,
                IsDelivered = x.IsDelivered,
                IsInCity = x.IsInCity,
                IsInForeignCity = x.IsInForeignCity,
                IsOnRoad = x.IsOnRoad,
                IsOnroadToForeignCity = x.IsOnroadToForeignCity,
                Kq = x.Kq,
                OrderFromCity = x.OrderFromCity,
                OrderFromDistrict = x.OrderFromDistrict,
                OrderToCity = x.OrderToCity,
                OrderToDistrict = x.OrderToDistrict,
                PackageCount = x.PackageCount,
                Price = x.Price,
                ToAdress = x.ToAdress,
                ToPhoneNumber = x.ToPhoneNumber,
                ToFullName = x.ToFullname,
                IsForeignCourierAccepted = x.IsForeignCourierAccepted,
                IsCash = x.IsCash,
                IsFast = x.IsFast,
                PageCount = (int)Math.Ceiling((decimal)ordersquery.Count() / 8)

            }).ToListAsync();

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCourierHistory(int page)
        {
            IQueryable<Order> ordersquery = default;
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

            ordersquery = await _orderRead.GetAllAsync(x => (x.Courier==user&&x.IsInStorage==true)||(x.ForeignCourier==user&&x.IsDelivered==true), false, true, "Customer", "Courier",
"OrderFromCity",
"OrderFromDistrict",
"OrderToCity",
"OrderToDistrict");
          int Maxnum=  ordersquery.Count();
            ordersquery = ordersquery.OrderByDescending(x => x.Id);
            ordersquery = ordersquery.Skip((page-1)*10).Take(10);

            var orders = await ordersquery.Select(x => new OrderGetDto
            {
                Id = x.Id,
                Courier = x.Courier,
                Customer = x.Customer,
                FromAdress = x.FromAdress,
                IsAccepted = x.IsAccepted,
                IsInStorage = x.IsInStorage,
                IsOutStorage = x.IsOutStorage,
                IsCourierArrive = x.IsCourierArrive,
                IsCourierArriveForTake = x.IsCourierArriveForTake,
                IsCourierOnRoad = x.IsCourierOnRoad,
                IsCourierTaked = x.IsCourierTaked,
                IsDelivered = x.IsDelivered,
                IsInCity = x.IsInCity,
                IsInForeignCity = x.IsInForeignCity,
                IsOnRoad = x.IsOnRoad,
                IsOnroadToForeignCity = x.IsOnroadToForeignCity,
                Kq = x.Kq,
                OrderFromCity = x.OrderFromCity,
                OrderFromDistrict = x.OrderFromDistrict,
                OrderToCity = x.OrderToCity,
                OrderToDistrict = x.OrderToDistrict,
                PackageCount = x.PackageCount,
                Price = x.Price,
                ToAdress = x.ToAdress,
                ToPhoneNumber = x.ToPhoneNumber,
                ToFullName = x.ToFullname,
                IsForeignCourierAccepted = x.IsForeignCourierAccepted,
                IsCash = x.IsCash,
                IsFast = x.IsFast,
                CreatedDate = x.CreatedAt,
                PageCount = (int)Math.Ceiling((decimal)ordersquery.Count() / 8)

        }).ToListAsync();

            return orders;
        }
    }
}

