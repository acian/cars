package cars

class Car {

    Integer year
    String make
    String model
    String plate
    Owner owner

    static constraints = {
        year blank: false, nullable: false
        make blank: false, nullable: false
        model blank: false, nullable: false
    }

    static mapping = {
        table 'VehicleModelYear'
        version false
    }
}
