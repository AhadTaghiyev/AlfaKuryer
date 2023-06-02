using System;
using Microsoft.AspNetCore.Http;

namespace AlfaKuryer.Persistance.Extentions
{
    public static class HttpContextExtensions
    {
        public static string GetConfirmationLink(this HttpContext context, string email, string token,string url)
        {
            var scheme = context.Request.Scheme;
            var host = context.Request.Host.Host;
            var port = context.Request.Host.Port;

            var urlBuilder = new UriBuilder
            {
                Scheme = scheme,
                Host = host,
                Path = url
            };
            if(port != null)
            {
                urlBuilder.Port = (int)port;
            }

            var query = $"email={Uri.EscapeDataString(email)}&token={Uri.EscapeDataString(token)}";
            urlBuilder.Query = query;

            return urlBuilder.Uri.ToString();
        }


    }
}

