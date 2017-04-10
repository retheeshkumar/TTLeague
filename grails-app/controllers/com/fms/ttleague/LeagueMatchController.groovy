package com.fms.ttleague



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LeagueMatchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LeagueMatch.list(params), model:[leagueMatchInstanceCount: LeagueMatch.count()]
    }

    def show(LeagueMatch leagueMatchInstance) {
        respond leagueMatchInstance
    }

    def create() {
        respond new LeagueMatch(params)
    }

    @Transactional
    def save(LeagueMatch leagueMatchInstance) {
        if (leagueMatchInstance == null) {
            notFound()
            return
        }

        if (leagueMatchInstance.hasErrors()) {
            respond leagueMatchInstance.errors, view:'create'
            return
        }

        leagueMatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'leagueMatch.label', default: 'LeagueMatch'), leagueMatchInstance.id])
                redirect leagueMatchInstance
            }
            '*' { respond leagueMatchInstance, [status: CREATED] }
        }
    }

    def edit(LeagueMatch leagueMatchInstance) {
        respond leagueMatchInstance
    }

    @Transactional
    def update(LeagueMatch leagueMatchInstance) {
        if (leagueMatchInstance == null) {
            notFound()
            return
        }

        if (leagueMatchInstance.hasErrors()) {
            respond leagueMatchInstance.errors, view:'edit'
            return
        }

        leagueMatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LeagueMatch.label', default: 'LeagueMatch'), leagueMatchInstance.id])
                redirect leagueMatchInstance
            }
            '*'{ respond leagueMatchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LeagueMatch leagueMatchInstance) {

        if (leagueMatchInstance == null) {
            notFound()
            return
        }

        leagueMatchInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LeagueMatch.label', default: 'LeagueMatch'), leagueMatchInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'leagueMatch.label', default: 'LeagueMatch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
