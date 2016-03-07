package cars

import grails.transaction.Transactional

@Transactional
class OwnerService {

    def findAll(params) {
        def criteria = Owner.createCriteria()

        def result = criteria.list {
            if (params.dni != null && params.dni != "") {
                ilike('dni', new Long(params.dni))
            }

            if (params.lastName != null && params.lastName != "") {
                params.lastName = "%"+params.lastName+"%"
                ilike('lastName', params.lastName+"%")
            }

            if (params.name != null && params.name != "") {
                ilike('name', params.name+"%")
            }

            if (params.nationality != null && params.nationality != "") {
                ilike('nationality', params.nationality+"%")
            }

            firstResult(params.offset)
            maxResults(params.max)
        }

        return result
    }

    def countAll(params) {
        def criteria = Owner.createCriteria()

        def result = criteria.list {
            projections {
                count()
            }

            if (params.dni != null && params.dni != "") {
                ilike('dni', new Long(params.dni))
            }

            if (params.lastName != null && params.lastName != "") {
                ilike('lastName', params.lastName+"%")
            }

            if (params.name != null && params.name != "") {
                ilike('name', params.name+"%")
            }

            if (params.nationality != null && params.nationality != "") {
                ilike('nationality', params.nationality+"%")
            }
        }

        return result
    }

    def getById(id) {
        return Owner.findById(id);
    }

    def saveOwner(owner) {
        owner.save()
    }

    def deleteOwner(owner) {
        owner.delete(flush: true);
    }

}
