using System;
using Microsoft.EntityFrameworkCore.Migrations;
using MySql.EntityFrameworkCore.Metadata;

#nullable disable

namespace AlfaKuryer.Persistance.Migrations
{
    /// <inheritdoc />
    public partial class addecassir : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.AddPrimaryKey(
                name: "PK_CourierBalances",
                table: "CourierBalances",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "CassirBalances",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySQL:ValueGenerationStrategy", MySQLValueGenerationStrategy.IdentityColumn),
                    OrderNumber = table.Column<int>(type: "int", nullable: false),
                    ApplicationUserId = table.Column<string>(type: "varchar(255)", nullable: false),
                    IsCash = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    IsFast = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    OrderPrice = table.Column<double>(type: "double", nullable: false),
                    IsDeleted = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CassirBalances", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CassirBalances_AspNetUsers_ApplicationUserId",
                        column: x => x.ApplicationUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySQL:Charset", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_CassirBalances_ApplicationUserId",
                table: "CassirBalances",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId",
                table: "CourierBalances",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CourierBalances_Orders_OrderId",
                table: "CourierBalances",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalances_AspNetUsers_ApplicationUserId",
                table: "CourierBalances");

            migrationBuilder.DropForeignKey(
                name: "FK_CourierBalances_Orders_OrderId",
                table: "CourierBalances");

            migrationBuilder.DropTable(
                name: "CassirBalances");

            migrationBuilder.DropPrimaryKey(
                name: "PK_CourierBalances",
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
    }
}
