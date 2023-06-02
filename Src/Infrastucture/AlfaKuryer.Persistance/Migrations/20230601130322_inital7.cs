using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class inital7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Districts_OrderFromDistrictId",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Districts_OrderToDistrictId",
                table: "Orders");

            migrationBuilder.AlterColumn<int>(
                name: "OrderToDistrictId",
                table: "Orders",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "OrderFromDistrictId",
                table: "Orders",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Districts_OrderFromDistrictId",
                table: "Orders",
                column: "OrderFromDistrictId",
                principalTable: "Districts",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Districts_OrderToDistrictId",
                table: "Orders",
                column: "OrderToDistrictId",
                principalTable: "Districts",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Districts_OrderFromDistrictId",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Districts_OrderToDistrictId",
                table: "Orders");

            migrationBuilder.AlterColumn<int>(
                name: "OrderToDistrictId",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "OrderFromDistrictId",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Districts_OrderFromDistrictId",
                table: "Orders",
                column: "OrderFromDistrictId",
                principalTable: "Districts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Districts_OrderToDistrictId",
                table: "Orders",
                column: "OrderToDistrictId",
                principalTable: "Districts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
