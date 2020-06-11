class Main{
    public static void main(String[] args) {
        Car car = new Car();
        car.license = "AMQ123";
        car.driver = "Andres Herrera";
        car.passenger = 4;
        
        Car car2 = new Car();
        car2.license = "QWE567";
        car2.driver = "Gim Martinez";
        car2.passenger = 3;

        car.printDataCar();
        car2.printDataCar();
    }
}