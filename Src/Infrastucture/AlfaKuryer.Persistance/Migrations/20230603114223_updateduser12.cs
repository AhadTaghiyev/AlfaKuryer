using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class updateduser12 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "DeliveryMethod",
                table: "Rates",
                type: "longtext",
                nullable: false);

            migrationBuilder.AlterColumn<string>(
                name: "Citizen",
                table: "AspNetUsers",
                type: "longtext",
                nullable: true,
                oldClrType: typeof(bool),
                oldType: "tinyint(1)",
                oldNullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DeliveryMethod",
                table: "Rates");

            migrationBuilder.AlterColumn<bool>(
                name: "Citizen",
                table: "AspNetUsers",
                type: "tinyint(1)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "longtext",
                oldNullable: true);
        }
    }
}
