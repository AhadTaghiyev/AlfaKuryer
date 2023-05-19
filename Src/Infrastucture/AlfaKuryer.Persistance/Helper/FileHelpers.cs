

namespace AlfaKuryer.Persistance.Helper
{
    using Microsoft.AspNetCore.Http;
    public static class FileHelpers
    {
        public static string SaveImage(this IFormFile FirmFile, string root, string folder)
        {
            string RootPath = Path.Combine(root, folder);
            string FileName = Guid.NewGuid().ToString() + FirmFile.FileName;
            string FullPath = Path.Combine(RootPath, FileName);
            using (FileStream fileStream = new FileStream(FullPath, FileMode.Create))
            {
                FirmFile.CopyTo(fileStream);
            }
            return FileName;
        }

    }
}
