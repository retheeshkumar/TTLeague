package com.fms.ttleague
import com.fms.auth.User

class DashboardController {

	def dashboardService
    def index() { }
	def adminDashboard(){
		
	}
	
	def userDashboard(){
		
	}
	
	def pointsTable(){
		def results = [:]
		def players = Player.list()
		players.each{
			results[it.id] = ["name":it.playerName,"match":0,"loss":0,"win":0,"setWon":0,"setLoss":0,"pointWon":0,"pointLoss":0,"gameDiff":0,"pDiff":0,"points":0] 
		}
		def cMatches = dashboardService.getCompletedMatches()
		cMatches.each{
			def wId = it.winner.id
			def lId = it.winner.id == it.playerHome.id? it.playerAway.id :it.playerHome.id
			results[wId].match += 1
			results[lId].match += 1
			results[wId].win += 1
			results[lId].loss += 1
			results[it.playerHome.id].setWon += it.playerHomeSets
			results[it.playerHome.id].setLoss += it.playerAwaySets
			results[it.playerAway.id].setWon += it.playerAwaySets 
			results[it.playerAway.id].setLoss += it.playerHomeSets
			it.games.each{g->
				results[it.playerHome.id].pointWon += g.playerHomePoints
				results[it.playerHome.id].pointLoss += g.playerAwayPoints
				results[it.playerAway.id].pointWon += g.playerAwayPoints
				results[it.playerAway.id].pointLoss += g.playerHomePoints
			}
		}
		def rList = []
		results.each{key,v->
			v.points = v.win*3
			v.gameDiff = v.setWon - v.setLoss
			v.pDiff = v.pointWon - v.pointLoss
			rList.add(v)
		}
		rList.sort{x,y->
			if(x.points == y.points){
			  y.gameDiff <=> x.gameDiff
			}else{
			  y.points <=> x.points
			}
		  }
		[results:rList]
	}
	
	def predictionTable(){
		def r = Prediction.executeQuery("select p.user.id , count(p.id)  from Prediction p where p.predictedPlayer = p.leagueMatch.winner group by user  ")
		println r
		println"==============================="
		def pList = [:]
		User.list().each{
			if(!it.username.equals("LeagueAdmin")){
				pList[it.id] =["name":it.fullName,"count":0]
			}
		}
		r.each{
			pList[it[0]].count=it[1]
		}
		[pList:pList]
	}
}
