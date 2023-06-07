using System;
using Microsoft.AspNetCore.Hosting.Server;
using Microsoft.Extensions.Configuration;
using System.Net;
using System.Net.Mail;

namespace AlfaKuryer.Infrastucture.ExtornerlServices
{
    public class MailService
    {
        private readonly IConfiguration _configuration;

        public MailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task Send(string to, string link, string name)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(_configuration.GetSection("Keys")["Email"], "message app");
            mail.To.Add(new MailAddress(to));
            mail.Subject = "AlfaKuryer";
            mail.Body = $"Təsdiq üçün aşağıdakı linkə klikləyin: {link}";
            mail.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(_configuration.GetSection("Keys")["Email"], _configuration.GetSection("Keys")["Secret"]);
            smtp.Send(mail);
        }

        public async Task SendAll(string to,string subject,string message)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(_configuration.GetSection("Keys")["Email"], "message app");
            mail.To.Add(new MailAddress(to));
            mail.Subject = "subject";
            mail.Body = message;
            mail.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(_configuration.GetSection("Keys")["Email"], _configuration.GetSection("Keys")["Secret"]);
            smtp.Send(mail);
        }


    }
}

