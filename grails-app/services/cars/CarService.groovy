package cars

import grails.transaction.Transactional

import static org.grails.datastore.gorm.GormStaticApi.executeQuery

@Transactional
class CarService {

    def findAll(params) {

        def sqlMap = getSQlQuery(params);

        def list = Car.executeQuery(sqlMap.sql,
                sqlMap.sqlParamaeters,
            [max:params.max,offset:params.offset])

        return list
    }

    def countAll(params) {
        def sqlMap = getSQlQuery(params);

        println "select count(id) " + sqlMap.sql

        def list = Car.executeQuery("select count(id) " + sqlMap.sql,
                sqlMap.sqlParamaeters)

        return list
    }

    def getSQlQuery(params) {
        def sql = "from Car"

        def sqlParamaeters = [:]

        def firstCondition = false
        if(params.year != null && params.year != "") {
            if(!firstCondition)
                sql += " where "
            else
                sql += " and "

            sql += " year = :year "

            sqlParamaeters.put('year', new Integer(params.year))

            firstCondition = true
        }

        if(params.make != null && params.make != "") {
            if(!firstCondition)
                sql += " where "
            else
                sql += " and "

            sql += " make like :make "

            params.make = "%"+params.make+"%"
            sqlParamaeters.put('make', params.make)

            firstCondition = true
        }

        if(params.model != null && params.model != "") {
            if(!firstCondition)
                sql += " where "
            else
                sql += " and "

            sql += " model like :model "

            params.model = "%"+params.model+"%"
            sqlParamaeters.put('model', params.model)

            firstCondition = true
        }

        return [sql: sql, sqlParamaeters: sqlParamaeters];
    }

    def getById(id) {
        return Car.findById(id);
    }

    def saveCar(car) {
        car.save()
    }

    def deleteCar(car) {
        car.delete(flush: true);
    }
}
