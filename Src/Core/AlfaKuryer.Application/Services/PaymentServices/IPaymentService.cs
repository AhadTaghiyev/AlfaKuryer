using System;
namespace AlfaKuryer.Application.Services.PaymentServices
{
	public interface IPaymentService
	{
        public  Task<string> PayMent(double TotalPrice, int id);

    }
}

