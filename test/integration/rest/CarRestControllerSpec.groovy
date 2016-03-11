package rest

import cars.Car
import cars.Owner
import grails.test.spock.IntegrationSpec
import spock.lang.*

/**
 *
 */
class CarRestControllerSpec extends IntegrationSpec {

    @Shared
    CarRestController controller = new CarRestController()

    def ownerId

    def setup() {
        // Initialize DB
        Owner owner = new Owner(dni: 11222333, lastName: "Smith", name: "Willy", nationality: "American").save();

        new Car(year: 2011, make: "Ford", model: "Fiesta", plate: "AAA999", owner: owner).save()

        ownerId = owner.id
    }

    def cleanup() {
    }

    void "test creating a car 2"() {
        when:
        // Set request JSON body
        controller.request.json = [
                year: "2012", make: "Ford", model: "Fiesta", plate: "BBB999", idOwner: ownerId
        ]
        controller.save()
        def response = controller.response.json

        println("response : " + response)
        then:
        Car.count == 2
    }
}
