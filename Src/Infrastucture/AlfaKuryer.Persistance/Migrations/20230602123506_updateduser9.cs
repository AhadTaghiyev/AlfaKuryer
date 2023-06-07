using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class updateduser9 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "MessgaeBy",
                table: "AspNetUsers",
                type: "tinyint(1)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "OtpCode",
                table: "AspNetUsers",
                type: "longtext",
                nullable: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "MessgaeBy",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "OtpCode",
                table: "AspNetUsers");
        }
    }
}
