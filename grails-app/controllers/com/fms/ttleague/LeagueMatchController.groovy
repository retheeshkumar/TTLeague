package com.fms.ttleague


import com.fms.auth.User
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LeagueMatchController {

	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 13, 100)
		def listLm = LeagueMatch.list(params)
		def curUser = User.get(springSecurityService.getCurrentUser().id)
		def roleNames = springSecurityService.getPrincipal().getAuthorities()*.authority
		def pred=[:]
		if(roleNames.contains("ROLE_USER")){
			def l = Prediction.createCriteria().list {
				and{
				   eq('user',curUser)
				   'in'('leagueMatch',listLm)
				}
			}
			l.each{
				pred[it.leagueMatch.id] = it.predictedPlayer
			}
		}
        respond listLm, model:[leagueMatchInstanceCount: LeagueMatch.count(),pred:pred]
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
        respond leagueMatchInstance, model:[playerList: [leagueMatchInstance.playerAway, leagueMatchInstance.playerHome]]
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
	
	def editPrediction() {
		def curUser = User.get(springSecurityService.getCurrentUser().id)
		def leagurMatch = LeagueMatch.get(params.id)
		Prediction predictionInstance = Prediction.findByUserAndLeagueMatch(curUser,leagurMatch)
		respond predictionInstance
	}

	@Transactional
	def updatePrediction(Prediction predictionInstance) {
		if (predictionInstance == null) {
			notFound()
			return
		}

		if (predictionInstance.hasErrors()) {
			respond predictionInstance.errors, view:'editPrediction'
			return
		}

		predictionInstance.save flush:true
		flash.message = 'Your prediction updated'
		redirect(action: "index")
	}
}
