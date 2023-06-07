using System;
using System.Linq.Expressions;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Infrastucture.ExtornerlServices;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;

namespace AlfaKuryer.Infrastucture.BackgorundJobs
{
    public class MessageJob
    {
        private readonly UserManager<ApplicationUser> _userManage;
        private readonly IConfiguration _config;

        public MessageJob(UserManager<ApplicationUser> userManage, IConfiguration config)
        {
            _userManage = userManage;
            _config = config;
        }

        public static async Task<string> SedMessage(Expression<Action> sendExpression)
        {
           
            var JobId = Hangfire.BackgroundJob.Schedule(sendExpression, TimeSpan.FromSeconds(1));
            return JobId;
        }

        public static async Task DeleteMessage(string id)
        {
            Hangfire.BackgroundJob.Delete(id);
        }

        public static async Task SendAll( Expression<Action> sendExpression)
        {
            Hangfire.BackgroundJob.Schedule(sendExpression, TimeSpan.FromSeconds(10));
        }

        public   async Task SendMessageAllUsers(string subject,string mail)
        {
            var users = _userManage.Users.Where(x => x.Role == "User" || x.Role == "Company").ToList();

            foreach (var item in users)
            {
                if (item.MessgaeBy==true)
                {
                    MailService mailService = new MailService(_config);
                    var JobId = Hangfire.BackgroundJob.Schedule(()=> mailService.SendAll(item.Email,subject,mail), TimeSpan.FromSeconds(10));
                }
                else
                {
                    SmsService smsService = new SmsService();
                    var JobId = Hangfire.BackgroundJob.Schedule(() => SmsService.Send(mail,item.PhoneNumber), TimeSpan.FromSeconds(10));
                }
            }
        }
    }
}

