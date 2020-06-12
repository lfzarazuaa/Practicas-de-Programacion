from car import Car
from account import Account

if __name__ == "__main__":
    car = Car("AMS234", Account("Andres Herrera", "ANDA876"))
    print(vars(car))
    print(vars(car.driver))

    car2 = Car("QWE567",Account("Gim Martinez", "GIMM294"))
    print(vars(car2.driver))
