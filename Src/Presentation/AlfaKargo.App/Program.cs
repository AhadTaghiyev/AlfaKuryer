using System.Globalization;
using System.Reflection;
using AlfaKuryer.Application.ServiceRegisterations;
using AlfaKuryer.Persistance.Context;
using AlfaKuryer.Persistance.ServiceRegisterations;
using Beacon.app.Resources;
using Hangfire;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddApplicationServiceRegistration();
builder.Services.AddPersistenceRegistration(builder.Configuration);
builder.Services.AddLocalization(opt => { opt.ResourcesPath = "Resources"; });

builder.Services.AddMvc()
.AddViewLocalization()
.AddDataAnnotationsLocalization(
    opt => opt.DataAnnotationLocalizerProvider = (type, factory) =>
    {
        var assembliyName = new AssemblyName(typeof(SharedModelResource).GetTypeInfo().Assembly.FullName);
        return factory.Create(nameof(SharedModelResource), assembliyName.Name);
    }
    );


builder.Services.Configure<RequestLocalizationOptions>(opt =>
{
    var supportedCultures = new List<CultureInfo>
                {
                    new CultureInfo("en-US"),
                    new CultureInfo("az-AZ"),
                    new CultureInfo("ru-RU"),

                };
    opt.DefaultRequestCulture = new RequestCulture("en-US");
    opt.SupportedCultures = supportedCultures;
    opt.SupportedUICultures = supportedCultures;

    opt.RequestCultureProviders = new List<IRequestCultureProvider>
                {
                    new  QueryStringRequestCultureProvider(),
                    new CookieRequestCultureProvider(),
                    new AcceptLanguageHeaderRequestCultureProvider()
                };
});
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
   
}


app.UseHangfireDashboard("/hangfire");
app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

var options = app.Services.GetRequiredService<IOptions<RequestLocalizationOptions>>().Value;
app.UseRequestLocalization(options);




app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
);

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);



app.Run();
