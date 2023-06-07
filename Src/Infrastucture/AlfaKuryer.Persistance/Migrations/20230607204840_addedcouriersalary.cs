using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class addedcouriersalary : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsFast",
                table: "PriceForOrders",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<double>(
                name: "CourierSalaryForFast",
                table: "AspNetUsers",
                type: "double",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "CourierSalaryForSimple",
                table: "AspNetUsers",
                type: "double",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsFast",
                table: "PriceForOrders");

            migrationBuilder.DropColumn(
                name: "CourierSalaryForFast",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "CourierSalaryForSimple",
                table: "AspNetUsers");
        }
    }
}
