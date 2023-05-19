

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Services.SettingServices;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Services;
using MessageScheduler.Data.Repositories.ReadRepositories;
using MessageScheduler.Data.Repositories.WriteRepositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace AlfaKuryer.Persistance.ServiceRegisterations
{
    public static class ServiceRegisteration
    {
        public static void AddPersistenceRegistration(this IServiceCollection services, IConfiguration config)
        {
            services.AddDbContext<AlfaKuryerDbContext>(option =>
            {
                option.UseMySQL(config.GetConnectionString("Default"));
            });
            services.AddScoped<ISettingReadRepository, SettingReadRepository>();
            services.AddScoped<ISettingWriteRepository, SettingWriteRepository>();
            services.AddScoped<ISettingService, SettingService>();
        }
    }
}
