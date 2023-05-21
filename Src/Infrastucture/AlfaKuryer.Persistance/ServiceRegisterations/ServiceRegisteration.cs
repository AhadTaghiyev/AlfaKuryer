

using AlfaKuryer.Application.Repositories.ReadRepositories;
using AlfaKuryer.Application.Repositories.WriteRepositories;
using AlfaKuryer.Application.Services.CityServices;
using AlfaKuryer.Application.Services.DistrictServices;
using AlfaKuryer.Application.Services.HelpServices;
using AlfaKuryer.Application.Services.MessageService;
using AlfaKuryer.Application.Services.NewsServices;
using AlfaKuryer.Application.Services.RateServices;
using AlfaKuryer.Application.Services.SettingServices;
using AlfaKuryer.Application.Services.SlideService;
using AlfaKuryer.Domain.Entities;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.Repositories.ReadRepositories;
using AlfaKuryer.Persistance.Repositories.WriteRepositories;
using AlfaKuryer.Persistance.Services;
using MessageScheduler.Data.Repositories.ReadRepositories;
using MessageScheduler.Data.Repositories.WriteRepositories;
using Microsoft.AspNetCore.Identity;
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
            #region Settings
            services.AddScoped<ISettingReadRepository, SettingReadRepository>();
            services.AddScoped<ISettingWriteRepository, SettingWriteRepository>();
            services.AddScoped<ISettingService, SettingService>();
            #endregion
            #region Rates
            services.AddScoped<IRateReadRepository, RateReadRepository>();
            services.AddScoped<IRateWriteRepository, RateWriteRepository>();
            services.AddScoped<IRateService, RateService>();
            #endregion
            #region Helps
            services.AddScoped<IHelpReadRepository, HelpReadRepository>();
            services.AddScoped<IHelpWriteRepository, HelpWriteRepository>();
            services.AddScoped<IHelpService, HelpService>();
            #endregion
            #region Cities
            services.AddScoped<ICityReadRepository, CityReadRepository>();
            services.AddScoped<ICityWriteRepository, CityWriteRepository>();
            services.AddScoped<ICityService, CityService>();
            #endregion
            #region Districts
            services.AddScoped<IDistrictReadRepository, DistrictReadRepository>();
            services.AddScoped<IDistrictWriteRepository, DistrictWriteRepository>();
            services.AddScoped<IDistrictService, DistrictService>();
            #endregion
            #region Slides
            services.AddScoped<ISlideReadRepository, SlideReadRepository>();
            services.AddScoped<ISlideWriteRepository, SlideWriteRepository>();
            services.AddScoped<ISlideService, SlideService>();
            #endregion
            #region News
            services.AddScoped<INewsReadRepository, NewsReadRepository>();
            services.AddScoped<INewsWriteRepository, NewsWriteRepository>();
            services.AddScoped<INewsService, NewsService>();
            #endregion

            #region News
            services.AddScoped<IMessageReadRepository, MessageReadRepository>();
            services.AddScoped<IMessageWriteRepository, MessageWriteRepository>();
            services.AddScoped<IMessageService, MessageService>();
            #endregion
            services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<AlfaKuryerDbContext>()
            .AddDefaultTokenProviders();
        }
    }
}
