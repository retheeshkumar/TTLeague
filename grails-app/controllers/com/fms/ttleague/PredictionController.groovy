package com.fms.ttleague



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PredictionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Prediction.list(params), model:[predictionInstanceCount: Prediction.count()]
    }

    def show(Prediction predictionInstance) {
        respond predictionInstance
    }

    def create() {
        respond new Prediction(params)
    }

    @Transactional
    def save(Prediction predictionInstance) {
        if (predictionInstance == null) {
            notFound()
            return
        }

        if (predictionInstance.hasErrors()) {
            respond predictionInstance.errors, view:'create'
            return
        }

        predictionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prediction.label', default: 'Prediction'), predictionInstance.id])
                redirect predictionInstance
            }
            '*' { respond predictionInstance, [status: CREATED] }
        }
    }

    def edit(Prediction predictionInstance) {
        respond predictionInstance
    }

    @Transactional
    def update(Prediction predictionInstance) {
        if (predictionInstance == null) {
            notFound()
            return
        }

        if (predictionInstance.hasErrors()) {
            respond predictionInstance.errors, view:'edit'
            return
        }

        predictionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prediction.label', default: 'Prediction'), predictionInstance.id])
                redirect predictionInstance
            }
            '*'{ respond predictionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Prediction predictionInstance) {

        if (predictionInstance == null) {
            notFound()
            return
        }

        predictionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prediction.label', default: 'Prediction'), predictionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prediction.label', default: 'Prediction'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
