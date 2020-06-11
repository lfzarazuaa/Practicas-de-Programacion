from car import Car

if __name__ == "__main__":
    car = Car()
    car.license = "AMS234"
    car.driver = "Andres Herrera"
    print(vars(car))

    car2 = Car()
    car2.license = "QWE567"
    car2.driver = "Gim Martinez"
    print(vars(car2))
