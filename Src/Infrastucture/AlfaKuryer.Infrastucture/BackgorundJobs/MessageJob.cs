using System;
using System.Linq.Expressions;

namespace AlfaKuryer.Infrastucture.BackgorundJobs
{
    public class MessageJob
    {

        public static async Task<string> SedMessage(Expression<Action> sendExpression)
        {
           
            var JobId = Hangfire.BackgroundJob.Schedule(sendExpression, TimeSpan.FromSeconds(1));
            return JobId;
        }

        public static async Task DeleteMessage(string id)
        {
            Hangfire.BackgroundJob.Delete(id);
        }



    }
}

