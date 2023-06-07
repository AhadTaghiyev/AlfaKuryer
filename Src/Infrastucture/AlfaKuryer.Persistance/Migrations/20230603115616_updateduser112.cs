using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class updateduser112 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_AspNetUsers_ApplicationUserId",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_ApplicationUserId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "AspNetUsers");

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Adresses",
                type: "varchar(255)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Adresses_ApplicationUserId",
                table: "Adresses",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Adresses_AspNetUsers_ApplicationUserId",
                table: "Adresses",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Adresses_AspNetUsers_ApplicationUserId",
                table: "Adresses");

            migrationBuilder.DropIndex(
                name: "IX_Adresses_ApplicationUserId",
                table: "Adresses");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "Adresses");

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "AspNetUsers",
                type: "varchar(255)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_ApplicationUserId",
                table: "AspNetUsers",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_AspNetUsers_ApplicationUserId",
                table: "AspNetUsers",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
