using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.Migrations
{
    public partial class MySecondMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    CategoryId = table.Column<string>(maxLength: 50, nullable: false),
                    CategoryName = table.Column<string>(maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.CategoryId);
                });

            migrationBuilder.CreateTable(
                name: "Warehouses",
                columns: table => new
                {
                    WarehouseId = table.Column<string>(maxLength: 50, nullable: false),
                    WarehouseName = table.Column<string>(maxLength: 100, nullable: false),
                    WarehouseAddress = table.Column<string>(maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Warehouses", x => x.WarehouseId);
                });

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    ProductId = table.Column<string>(maxLength: 10, nullable: false),
                    ProductName = table.Column<string>(maxLength: 100, nullable: false),
                    ProductDescription = table.Column<string>(maxLength: 600, nullable: true),
                    TotalQuantity = table.Column<int>(nullable: false),
                    CategoryId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Products", x => x.ProductId);
                    table.ForeignKey(
                        name: "FK_Products_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "CategoryId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Storages",
                columns: table => new
                {
                    StorageId = table.Column<string>(maxLength: 50, nullable: false),
                    LastUpdate = table.Column<DateTime>(nullable: false),
                    PartialQuantity = table.Column<int>(nullable: false),
                    ProductId = table.Column<string>(nullable: true),
                    WarehouseId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Storages", x => x.StorageId);
                    table.ForeignKey(
                        name: "FK_Storages_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Storages_Warehouses_WarehouseId",
                        column: x => x.WarehouseId,
                        principalTable: "Warehouses",
                        principalColumn: "WarehouseId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "InputOutputs",
                columns: table => new
                {
                    InputOutputId = table.Column<string>(maxLength: 50, nullable: false),
                    InputOutputDate = table.Column<DateTime>(nullable: false),
                    Quantity = table.Column<int>(nullable: false),
                    IsInput = table.Column<bool>(nullable: false),
                    StorageId = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InputOutputs", x => x.InputOutputId);
                    table.ForeignKey(
                        name: "FK_InputOutputs_Storages_StorageId",
                        column: x => x.StorageId,
                        principalTable: "Storages",
                        principalColumn: "StorageId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "CategoryId", "CategoryName" },
                values: new object[,]
                {
                    { "AOL", "Alimentos de origen animal" },
                    { "ASH", "Aseo Hogar" },
                    { "ASP", "Aseo Personal" },
                    { "MVL", "Equipo de computo móvil" },
                    { "BNC", "Bancos de piezas" },
                    { "HGR", "Hogar" },
                    { "PRF", "Perfumería" },
                    { "SLD", "Salud" },
                    { "VDJ", "Video Juegos" }
                });

            migrationBuilder.InsertData(
                table: "Warehouses",
                columns: new[] { "WarehouseId", "WarehouseAddress", "WarehouseName" },
                values: new object[,]
                {
                    { "4f04af79-0c22-459f-9fc0-b607758becce", "Calle 8 con 23", "Bodega Central" },
                    { "ba713f00-e2bc-457d-b20d-9203dfb771b0", "Calle norte con occidente", "Bodega Norte" },
                    { "259f9779-8342-4579-b08b-35a58470b143", "Cerro de la estrella #455", "Bodega del Este" },
                    { "55e6567f-01a5-4507-ab20-2434f152c91e", "Calle 5 con 48", "Bodega del Oeste" },
                    { "90f336e1-026a-494c-bc80-28eb9d991ca7", "Miramontes #227", "Eje Central de Abasto" }
                });

            migrationBuilder.InsertData(
                table: "Products",
                columns: new[] { "ProductId", "CategoryId", "ProductDescription", "ProductName", "TotalQuantity" },
                values: new object[,]
                {
                    { "CRD-1283", "AOL", "Carne de los cerdos del monte", "Carne de cerdo", 0 },
                    { "ESC-87067", "ASH", "Escoba para el hogar", "Escoba", 0 },
                    { "CEP-1Y8091", "ASP", "Un cepillo de dientes para enjuage bucal.", "Cepillo de dientes", 0 },
                    { "JBN-123456", "ASP", "Mi jabón Juanito para el aseo personal ok.", "Jabón Juanito", 0 },
                    { "JUV-51658", "HGR", "Globo color naranja", "Globo", 0 },
                    { "SND-1325", "HGR", "Par de Sandalias Blazor", "Sandalia", 0 },
                    { "KSP-10348", "PRF", "Perfume marca Jafre", "Jafre", 0 },
                    { "KBJ-6789", "SLD", "Vendaje para uso comercial", "Venda", 0 },
                    { "TBC-916313", "SLD", "Medicamento efervescente", "Tabcin", 0 },
                    { "RRR-576894", "VDJ", "Juego de estrategia naval", "Game Of War", 0 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_InputOutputs_StorageId",
                table: "InputOutputs",
                column: "StorageId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_CategoryId",
                table: "Products",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Storages_ProductId",
                table: "Storages",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_Storages_WarehouseId",
                table: "Storages",
                column: "WarehouseId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "InputOutputs");

            migrationBuilder.DropTable(
                name: "Storages");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropTable(
                name: "Warehouses");

            migrationBuilder.DropTable(
                name: "Categories");
        }
    }
}
