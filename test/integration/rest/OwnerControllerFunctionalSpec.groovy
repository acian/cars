package rest

import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.test.spock.IntegrationSpec

class OwnerControllerFunctionalSpec extends IntegrationSpec{

    //grails test -Dserver.port=8090 run-app
    def setup() {
    }

    def cleanup() {
    }

    void "test creating and listing owners"() {
        given:
        RestBuilder rest = new RestBuilder()

        RestResponse response1 = rest.post("http://localhost:8090/cars/api/owners/") {
            json([
                    dni: 11222333, lastName: "Smith", name: "Willy", nationality: "American"
            ])
            accept(JSON)
        }

        RestResponse response2 = rest.post("http://localhost:8090/cars/api/owners/") {
            json([
                    dni: 11222444, lastName: "Brown", name: "James", nationality: "American"
            ])
            accept(JSON)
        }

        RestResponse response3 = rest.post("http://localhost:8090/cars/api/owners/") {
            json([
                    dni: 11222555, lastName: "Lennon", name: "John", nationality: "American"
            ])
            accept(JSON)
        }

        println("resp 1 : " + response1.json + "resp 2 : " + response2.json + "resp 3 : " + response3.json)

        when:
        RestResponse response = rest.get("http://localhost:8090/cars/api/owners?currentPage=1") {
            accept(JSON)
        }

        println("the response is : " + response.json)

        then:
        assert response.status == 200
        assert response.json.content.cantItems[0] == 3

    }
}
