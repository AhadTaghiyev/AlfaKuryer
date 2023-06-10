using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class addeduserbalt2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId",
                table: "CourierBalances");

            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId1",
                table: "CourierBalances");

            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalances_Orders_OrderId",
                table: "CourierBalances");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CourierBalances",
                table: "CourierBalances");

            migrationBuilder.DropIndex(
                name: "IX_CourierBalances_ApplicationUserId1",
                table: "CourierBalances");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId1",
                table: "CourierBalances");

            migrationBuilder.RenameTable(
                name: "CourierBalances",
                newName: "CourierBalance");

            migrationBuilder.RenameIndex(
                name: "IX_CourierBalances_OrderId",
                table: "CourierBalance",
                newName: "IX_CourierBalance_OrderId");

            migrationBuilder.RenameIndex(
                name: "IX_CourierBalances_ApplicationUserId",
                table: "CourierBalance",
                newName: "IX_CourierBalance_ApplicationUserId");

            migrationBuilder.AlterColumn<int>(
                name: "OrderId",
                table: "CourierBalance",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<bool>(
                name: "IsCash",
                table: "CourierBalance",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsFast",
                table: "CourierBalance",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "OrderNumber",
                table: "CourierBalance",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<double>(
                name: "OrderPrice",
                table: "CourierBalance",
                type: "double",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CourierBalance",
                table: "CourierBalance",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalance_AspNetUsers_ApplicationUserId",
                table: "CourierBalance",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalance_Orders_OrderId",
                table: "CourierBalance",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalance_AspNetUsers_ApplicationUserId",
                table: "CourierBalance");

            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalance_Orders_OrderId",
                table: "CourierBalance");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CourierBalance",
                table: "CourierBalance");

            migrationBuilder.DropColumn(
                name: "IsCash",
                table: "CourierBalance");

            migrationBuilder.DropColumn(
                name: "IsFast",
                table: "CourierBalance");

            migrationBuilder.DropColumn(
                name: "OrderNumber",
                table: "CourierBalance");

            migrationBuilder.DropColumn(
                name: "OrderPrice",
                table: "CourierBalance");

            migrationBuilder.RenameTable(
                name: "CourierBalance",
                newName: "CourierBalances");

            migrationBuilder.RenameIndex(
                name: "IX_CourierBalance_OrderId",
                table: "CourierBalances",
                newName: "IX_CourierBalances_OrderId");

            migrationBuilder.RenameIndex(
                name: "IX_CourierBalance_ApplicationUserId",
                table: "CourierBalances",
                newName: "IX_CourierBalances_ApplicationUserId");

            migrationBuilder.AlterColumn<int>(
                name: "OrderId",
                table: "CourierBalances",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId1",
                table: "CourierBalances",
                type: "varchar(255)",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CourierBalances",
                table: "CourierBalances",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_CourierBalances_ApplicationUserId1",
                table: "CourierBalances",
                column: "ApplicationUserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId",
                table: "CourierBalances",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId1",
                table: "CourierBalances",
                column: "ApplicationUserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalances_Orders_OrderId",
                table: "CourierBalances",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
