using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.Migrations
{
    public partial class AddData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "259f9779-8342-4579-b08b-35a58470b143");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "4f04af79-0c22-459f-9fc0-b607758becce");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "55e6567f-01a5-4507-ab20-2434f152c91e");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "90f336e1-026a-494c-bc80-28eb9d991ca7");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "ba713f00-e2bc-457d-b20d-9203dfb771b0");

            migrationBuilder.InsertData(
                table: "Warehouses",
                columns: new[] { "WarehouseId", "WarehouseAddress", "WarehouseName" },
                values: new object[,]
                {
                    { "8e2214b6-3fc8-43e2-9268-973508d8be36", "Calle 8 con 23", "Bodega Central" },
                    { "70618960-17d2-4812-a697-1410593d340d", "Calle norte con occidente", "Bodega Norte" },
                    { "105a21a0-834c-46b8-a3cb-82dc9012b717", "Cerro de la estrella #455", "Bodega del Este" },
                    { "4726576e-2268-4137-8c5e-52ea317b19e5", "Calle 5 con 48", "Bodega del Oeste" },
                    { "89f0ac35-871e-4357-b736-cd40de0b33bf", "Miramontes #227", "Eje Central de Abasto" }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "105a21a0-834c-46b8-a3cb-82dc9012b717");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "4726576e-2268-4137-8c5e-52ea317b19e5");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "70618960-17d2-4812-a697-1410593d340d");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "89f0ac35-871e-4357-b736-cd40de0b33bf");

            migrationBuilder.DeleteData(
                table: "Warehouses",
                keyColumn: "WarehouseId",
                keyValue: "8e2214b6-3fc8-43e2-9268-973508d8be36");

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
        }
    }
}
