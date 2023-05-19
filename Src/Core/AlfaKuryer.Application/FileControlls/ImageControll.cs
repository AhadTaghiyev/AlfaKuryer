using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlfaKuryer.Application.FileControlls
{
    public static class ImageControll
    {
       

            public static void FileDelete(string root, string folder, string image)
            {
                string filePath = Path.Combine(root, folder, image);

                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
            }
            public static bool IsImageOkay(this IFormFile file)
            {
                return file.ContentType.Contains("image/");
            }
            public static bool İsSizeOk(this IFormFile file, int mb)
            {
                return file.Length / 1024 / 1024 < mb;
            }
        }
}
