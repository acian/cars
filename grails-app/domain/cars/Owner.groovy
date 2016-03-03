package cars

class Owner {

    Long dni
    String lastName
    String name
    String nationality
    static hasMany = [cars: Car]

    static constraints = {
        dni blank: false, nullable: false
        lastName blank: false, nullable: false
        name blank: false, nullable: false
        nationality blank: false, nullable: false
    }

    static mapping = {
        version false
    }
}