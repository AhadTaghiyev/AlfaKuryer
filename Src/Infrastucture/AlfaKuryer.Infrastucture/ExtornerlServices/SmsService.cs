using System;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace AlfaKuryer.Infrastucture.ExtornerlServices
{
	public class SmsService
	{
        public static void Send(string message,string phoneNumber)
        {
            string login = "alfakuryer";
            string password = "!3Dst%wSrEQO";
            string msisdn = phoneNumber;
            string text = message;
            string sender = "SMS TEST";
            string scheduled = "NOW";
            bool unicode = false;

            string key = GenerateKey(password, login, text, msisdn, sender);

            // Prepare the request data
            string requestData = $"{{\"login\":\"{login}\",\"key\":\"{key}\",\"msisdn\":\"{msisdn}\",\"text\":\"{text}\",\"sender\":\"{sender}\",\"scheduled\":\"{scheduled}\",\"unicode\":{unicode.ToString().ToLower()}}}";

            // Send the request
            string apiUrl = "https://apps.lsim.az/quicksms/v1/smssender"; // Gerçek API URL'siyle değiştirin
            using (WebClient client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/json";
                string response = client.UploadString(apiUrl, "POST", requestData);

                Console.WriteLine(response);
            }

        }

        static string GenerateKey(string password, string login, string text, string msisdn, string sender)
        {
            string passwordHash;
            string keyData;

            using (MD5 md5 = MD5.Create())
            {
                passwordHash = GetMd5Hash(md5, password);
            }

            keyData = passwordHash + login + text + msisdn + sender;

            using (MD5 md5 = MD5.Create())
            {
                byte[] data = Encoding.UTF8.GetBytes(keyData);
                byte[] hash = md5.ComputeHash(data);
                StringBuilder builder = new StringBuilder();

                for (int i = 0; i < hash.Length; i++)
                {
                    builder.Append(hash[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }

        static string GetMd5Hash(MD5 md5, string input)
        {
            byte[] data = md5.ComputeHash(Encoding.UTF8.GetBytes(input));

            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                builder.Append(data[i].ToString("x2"));
            }

            return builder.ToString();
        }
    }
}

