package rest
import cars.Car
import grails.converters.*
import groovy.json.JsonBuilder

class CarRestController {

    static responseFormats = ['json']

    def carService
    def ownerService

    def index(Car car) {
        params.max = new Integer(10)
        params.sort = "id"
        params.order = "desc"
        params.offset = (new Integer(params.currentPage)-1)*params.max

        def carList = carService.findAll(params)
        def carCount = carService.countAll(params);

        def json = new JsonBuilder()
        def root = json {
            "cantItems" carCount

            "items" carList.collect {item ->
                ["id":item.id,
                 "year":item.year,
                 "make":item.make,
                 "model":item.model,
                 "plate":item.plate
                 ]
            }
        }

        respond json;
    }

    def show() {
        def car = carService.getById(params.id)
        println car.getOwner().getLastName()
        car.getOwner().setLastName(car.getOwner().getLastName());

        def json = new JsonBuilder()
        def root = json {
            id            car.getId()
            year          car.getYear()
            make          car.getMake()
            model         car.getModel()
            plate         car.getPlate()
            ownerId       car.getOwner().getId()
            ownerDNI      car.getOwner().getDni()
            ownerLastName car.getOwner().getLastName()

        }


        respond root
    }

    def create() {
        respond new Car(params)
    }

    def save() {
        Car car = request.JSON;
        car.setId(null);

        def owner = ownerService.getById(request.JSON.idOwner)
        car.setOwner(owner)

        car = carService.saveCar(car)

        if(!car.hasErrors())
            respond status: 201
    }

    def update(Car ca) {
        Car car2 = request.JSON;

        ca.setModel(car2.getModel())
        ca.setMake(car2.getMake())
        ca.setYear(car2.getYear())
        ca.setPlate(car2.getPlate())

        def owner = ownerService.getById(request.JSON.idOwner)
        ca.setOwner(owner)

        ca = carService.saveCar(ca)

        if(!ca.hasErrors())
            respond status: 201
    }

    def delete(Car ca) {
        carService.deleteCar(ca)
        respond status: 201
    }
}