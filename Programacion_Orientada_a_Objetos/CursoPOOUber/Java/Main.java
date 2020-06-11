class Main{
    public static void main(String[] args) {
        Car car = new Car("AMQ123", new Account("Andres Herrera", "AND123"));
        car.passenger = 4;
        
        Car car2 = new Car("QWE567", new Account("Gim Martinez", "GIM123"));
        car2.passenger = 3;

        car.printDataCar();
        car2.printDataCar();
    }
}