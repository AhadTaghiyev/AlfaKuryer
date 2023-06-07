using System;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Xml.Serialization;
using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using AlfaKuryer.Persistance.Helper;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Application.Services.PaymentServices;

namespace AlfaKuryer.Persistance.Services
{
    public class PaymentService:IPaymentService
    {
        private readonly IHttpContextAccessor _httpContext;
        private readonly IOrderReadRepository _orderRead;
        private readonly IOrderWriteRepository _orderWrite;
        private readonly IUserPaymentReadRepository _paymentRead;
        private readonly IUserPaymentWriteRepository _paymentWrite;
        private readonly IHostingEnvironment _env;

        public PaymentService(IHttpContextAccessor httpContext, IHostingEnvironment env, IOrderReadRepository orderRead, IOrderWriteRepository orderWrite, IUserPaymentReadRepository userRead, IUserPaymentWriteRepository userWrite)
        {

            _httpContext = httpContext;
            _env = env;
            _orderRead = orderRead;
            _orderWrite = orderWrite;
            _paymentRead = userRead;
            _paymentWrite = userWrite;
        }

        public async Task<string> PayMent(double TotalPrice, int id)
        {
            dynamic result2;
            HttpClient httpClient = new HttpClient();

            // Specify the path to the pfx file using the HostingEnvironment
            string key = Path.Combine(_env.WebRootPath, "Payment", "certificate.pfx");

            string vaultUrl = "https://tstpg.kapitalbank.az:5443/Exec";

            string xmlSoap = $@"<?xml version='1.0' encoding='UTF-8'?><TKKPG><Request><Operation>CreateOrder</Operation><Language>AZ</Language><Order><OrderType>Purchase</OrderType><Merchant>E1000010</Merchant><Amount>{TotalPrice*100}</Amount><Currency>944</Currency><Description>xxxxxxxx</Description><ApproveURL>https://localhost:7179/order/PayConfirm/{id}</ApproveURL><CancelURL>https://micro.az/</CancelURL><DeclineURL>https://micro.az/</DeclineURL></Order></Request></TKKPG>";

            byte[] pfxRawData = await File.ReadAllBytesAsync(key);

            using (X509Certificate2 pfxCertWithKey = new X509Certificate2(pfxRawData, "Ahad123@"))
            {
                HttpClientHandler handler = new HttpClientHandler();
                handler.ClientCertificateOptions = ClientCertificateOption.Manual;
                handler.ServerCertificateCustomValidationCallback = (a, b, c, d) => { return true; };
                handler.ClientCertificates.Add(pfxCertWithKey);

                using (HttpContent content = new StringContent(xmlSoap, Encoding.UTF8, "text/xml"))
                using (var client = new HttpClient(handler))
                using (var request = new HttpRequestMessage(HttpMethod.Post, vaultUrl))
                {
                    request.Headers.Add("SOAPAction", string.Empty);
                    request.Content = content;

                    // Set TLS 1.2 as the security protocol
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                    var response = await client.SendAsync(request);
                    var result = await response.Content.ReadAsStringAsync();

                    XmlSerializer xmlSerializer = new XmlSerializer(typeof(TKKPG));
                    using (TextReader reader = new StringReader(result))
                    {
                        var data = (TKKPG)xmlSerializer.Deserialize(reader);

                        if (data.Response != null)
                        {
                            if (data.Response.Status == 0)
                            {
                                string url = $"https://tstpg.kapitalbank.az/index.jsp?ORDERID={data.Response.Order.OrderID}&SESSIONID={data.Response.Order.SessionID}";

                                string userId = _httpContext.HttpContext.User.Identity.Name;
                                if (userId != null)
                                {
                                    await _paymentWrite.AddAsync(new UserPayment
                                    {
                                        CustomerId = userId,
                                        DateTime = DateTime.UtcNow,
                                        IsPay = false,
                                        TotalPrice = TotalPrice,
                                        StatusId = data.Response.Order.SessionID,
                                        OrderNumber = data.Response.Order.OrderID
                                    });
                                    await _paymentWrite.SaveAsync();
                                }
                                return url;
                            }
                        }
                    }
                }
            }
            return "PaymentError";
        }

       
    }
}


