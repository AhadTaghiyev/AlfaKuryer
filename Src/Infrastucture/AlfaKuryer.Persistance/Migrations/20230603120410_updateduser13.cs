using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class updateduser13 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ApplicationUser",
                table: "Adresses");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ApplicationUser",
                table: "Adresses",
                type: "longtext",
                nullable: false);
        }
    }
}
