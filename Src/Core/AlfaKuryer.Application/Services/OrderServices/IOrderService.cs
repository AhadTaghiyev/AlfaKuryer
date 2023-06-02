using System;
using AlfaKuryer.Application.Dtos.OrderDtos;

namespace AlfaKuryer.Application.Services.OrderServices
{
	public interface IOrderService
	{
		public Task CreateOrder(OrderPostDto dto);
		public Task Accept(int id);
		public Task CurierOnRoad(int id);
		public Task CourierArriveForTake(int id);
		public Task CourierTaked(int id);
        public Task InStorage(int id);
        public Task OutStorage(int id);
        public Task OnroadToForeignCity(int id);
        public Task AchiveForeignCity(int id);
        public Task OnRoad(int id);
        public Task CourierArrived(int id);
        public Task Delivered(int id);
        public Task<IEnumerable<OrderGetDto>> GetAllBy(string customerId=null,string CourierId=null);
        public Task<IEnumerable<OrderGetDto>> GetAll();
        public Task<OrderGetDto> Get(int id);
        public  Task<IEnumerable<OrderGetDto>> GetAllByCustomer();
        public  Task<IEnumerable<OrderGetDto>> GetAllByCourier();
        public Task<IEnumerable<OrderGetDto>> GetOrderFromCourier();


    }
}

