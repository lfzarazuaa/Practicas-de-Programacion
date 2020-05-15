var miAuto = {
    marca: "Toyota",//Propiedad marca del objeto.
    modelo: "Corolla",//Propiedad modelo del objeto.
    annio: 2020,//Propiedad año del objeto.
    //Definición de función.
    detalleDelAuto: function () {
        console.log(`Auto ${this.modelo} ${this.annio}`); //this para ingresar a miembros del objeto.
    }
};

console.log(miAuto.marca);
console.log(miAuto.modelo);
console.log(miAuto.annio);
miAuto.detalleDelAuto();

//Constructor de objeto.
function auto(marca, modelo, annio) {
    this.marca = marca;
    this.modelo = modelo;
    this.annio = annio;
}

auto1 = new auto("Tesla", "Model X", 2018);
auto2 = new auto("Toyota", "Camry", 2019);
auto3 = new auto("Nissan", "Altima", 2020);

