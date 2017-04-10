package cpm.fms.ttleague

import grails.transaction.Transactional
import com.fms.ttleague.LeagueMatch

@Transactional
class DashboardService {

    def serviceMethod() {

    }
	
	def getCompletedMatches(){
			def cMatches = LeagueMatch.createCriteria().list {
				eq('isCompleted',true)
			}
			cMatches
	}
}
