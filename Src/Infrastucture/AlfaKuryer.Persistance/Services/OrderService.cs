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
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace AlfaKuryer.Persistance.Services
{
	public class OrderService:IOrderService
	{
        private readonly IOrderReadRepository _orderRead;
        private readonly IOrderWriteRepository _orderWrite;
        private readonly IMapper _mapper;
        private readonly IHttpContextAccessor _http;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;
        private readonly IPriceService _priceService;
        private readonly IConfiguration _config;
        public OrderService(IOrderReadRepository orderRead, IOrderWriteRepository orderWrite, IMapper mapper, IHttpContextAccessor http, UserManager<ApplicationUser> userManager, ICityService cityService, IDistrictService districtService, IPriceService priceService, IConfiguration config)
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
        }



        public async Task Accept(int id)
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
            var order = await _orderRead.GetAsync(x=>x.Id==id,true,true, "Customer");

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsAccepted = true;
            order.CourierId = user.Id;

           await _orderWrite.UpdateAsync(order);
           await _orderWrite.SaveAsync();
            MailService mail = new MailService(_config);
            Expression<Action> sendExpression = () => mail.Send(order.Customer.Email, $"Kuryer təyin olundu Ad:{order.Customer.Name}", order.Customer.Name);
            await MessageJob.SedMessage(sendExpression);

        }

        public async Task AchiveForeignCity(int id)
        {
            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsInForeignCity = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task CourierArrived(int id)
        {
            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsCourierArrive = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task CourierArriveForTake(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsCourierArriveForTake = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task CourierTaked(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsCourierTaked = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task CreateOrder(OrderPostDto dto)
        {
            var userName = _http.HttpContext?.User.Identity?.Name;
            var user =await _userManager.FindByNameAsync(userName);

            bool inCity = false;
       
            PriceGetDto priceGetDto = default;

            if (dto.OrderFromCityId == dto.OrderToCityId)
            {
                priceGetDto = await _priceService.Get(2);
                inCity = true;

            }
            else
            {
                priceGetDto = await _priceService.Get(1);
            }
            double Price;
            if (dto.Kq <= priceGetDto.UntilKq)
            {
                Price = priceGetDto.MinPrice;
            }
            else
            {
                double kqover=dto.Kq - priceGetDto.UntilKq;
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
                IsInCity = true,
                ToFullname=dto.ToFullName
            };

            order.OrderFromDistrictId = dto.OrderFromDistrictId != 0 ? dto.OrderFromDistrictId : null;
            order.OrderToDistrictId = dto.OrderToDistrictId != 0 ? dto.OrderToDistrictId : null;
            await _orderWrite.AddAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task CurierOnRoad(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsCourierOnRoad = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task Delivered(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsDelivered = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
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
            IQueryable<Order> ordersquery = ordersquery = await _orderRead.GetAllAsync(x => !x.IsDeleted, false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");


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
                Id=x.Id,
                ToFullName=x.ToFullname
            });

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllBy(string customerId=null,string couroerid=null)
        {
            IQueryable<Order> ordersquery=default;

            if (customerId != null)
                ordersquery = await _orderRead.GetAllAsync(x=>x.CustomerId==customerId,false,true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
            else if(couroerid!=null)
                ordersquery = await _orderRead.GetAllAsync(x => x.CustomerId == customerId, false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");
          
            var orders =await ordersquery.Select(x=>new OrderGetDto { Courier=x.Courier,Customer=x.Customer,FromAdress=x.FromAdress,IsAccepted=x.IsAccepted,
                IsInStorage=x.IsInStorage,IsOutStorage=x.IsOutStorage,IsCourierArrive=x.IsCourierArrive,IsCourierArriveForTake=x.IsCourierArriveForTake,
                IsCourierOnRoad=x.IsCourierOnRoad,IsCourierTaked=x.IsCourierTaked,IsDelivered=x.IsDelivered,IsInCity=x.IsInCity,IsInForeignCity=x.IsInForeignCity,
                IsOnRoad=x.IsOnRoad,IsOnroadToForeignCity=x.IsOnroadToForeignCity,Kq=x.Kq,OrderFromCity=x.OrderFromCity,OrderFromDistrict=x.OrderFromDistrict,OrderToCity=x.OrderToCity,
                OrderToDistrict=x.OrderToDistrict,PackageCount=x.PackageCount,Price=x.Price,ToAdress=x.ToAdress,ToPhoneNumber=x.ToPhoneNumber
            }).ToListAsync();

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCustomer()
        {
            IQueryable<Order> ordersquery = default;
            var user =await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

                ordersquery = await _orderRead.GetAllAsync(x => x.CustomerId == user.Id, false, true, "Customer", "Courier",
    "OrderFromCity",
    "OrderFromDistrict",
    "OrderToCity",
    "OrderToDistrict");

            var orders = await ordersquery.Select(x => new OrderGetDto
            {
                Id=x.Id,
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
                ToPhoneNumber = x.ToPhoneNumber
            }).ToListAsync();

            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetAllByCourier()
        {
            IQueryable<Order> queryOrder = default;
            var user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);

             queryOrder = await _orderRead.GetAllAsync(x => x.OrderFromCityId == user.CityId && user.ApplicationUserDistricts.FirstOrDefault(z => z.DistrictId == x.OrderFromDistrictId) != null, false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");

            var orders = await queryOrder.Select(x => new OrderGetDto
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
                CreatedDate=x.CreatedAt
            }).ToListAsync();

            return orders;
        }




        public async Task<IEnumerable<OrderGetDto>> GetOrderFromCourier()
        {
            var user = await _userManager.Users.Where(x=>x.UserName==_http.HttpContext.User.Identity.Name).Include(x=>x.ApplicationUserDistricts).FirstOrDefaultAsync();
            
            List<int?> Ids = new List<int?>();
            foreach (var item in user.ApplicationUserDistricts)
            {
                Ids.Add(item.DistrictId);
            }
      

            var queryOrder = await _orderRead.GetAllAsync(x=>Ids.Contains(x.OrderFromDistrictId),true,false, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");

       

  

            var orders = await queryOrder.Select(x => new OrderGetDto
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
                Id=x.Id
            }).ToListAsync();
            return orders;
        }

        public async Task<IEnumerable<OrderGetDto>> GetOrderToCourier()
        {
            var user = await _userManager.FindByNameAsync(_http.HttpContext?.User?.Identity?.Name);

            var queryorder = await _orderRead.GetAllAsync(x => user.ApplicationUserDistricts.Any(z => z.DistrictId == x.OrderToDistrictId && x.OrderFromCityId == x.OrderFromCityId), false, true, "Customer", "Courier", "OrderFromCity", "OrderFromDistrict", "OrderToCity", "OrderToDistrict");

            var orders = await queryorder.Select(x => new OrderGetDto
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
                ToPhoneNumber = x.ToPhoneNumber
            }).ToListAsync();
            return orders;
        }

        public async Task InStorage(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsInStorage = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task OnRoad(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsOnRoad = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task OnroadToForeignCity(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsOnroadToForeignCity = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }

        public async Task OutStorage(int id)
        {

            var order = await _orderRead.GetAsync(x => x.Id == id, true, true);

            if (order == null)
                throw new ItemNotFound("order not found");

            order.IsOutStorage = true;

            await _orderWrite.UpdateAsync(order);
            await _orderWrite.SaveAsync();
        }
    }
}

