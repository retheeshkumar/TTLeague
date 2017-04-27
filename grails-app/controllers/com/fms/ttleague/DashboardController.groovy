package com.fms.ttleague
import com.fms.auth.User
import com.fms.auth.UserRole
import com.fms.auth.Role

class DashboardController {

	def dashboardService
    def index() {
		redirect(action: "adminDashboard")
	}
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
		def totals = ["match":0, "win":0, "loss":0, "gameDiff":0, "pDiff":0,"points":0]
		results.each{key,v->
			v.points = v.win*3
			v.gameDiff = v.setWon - v.setLoss
			v.pDiff = v.pointWon - v.pointLoss
			rList.add(v)
			totals.match += v.match
			totals.win += v.win
			totals.loss += v.loss
			totals.gameDiff += v.gameDiff
			totals.pDiff += v.pDiff
			totals.points += v.points
		}
		rList.sort{x,y->
			if(x.points == y.points){
				if(x.gameDiff == y.gameDiff){
				   y.pDiff <=> x.pDiff
				}else{
					y.gameDiff <=> x.gameDiff
				}
			  
			}else{
			  y.points <=> x.points
			}
		  }
		[results:rList, totals:totals]
	}
	
	def predictionTable(){
		def matchDate = Date.parse("dd-MM-yyyy", "01-04-2017")
		def condition = '>'
		if(params.filterSelected.toString() == "2"){
			 matchDate = Date.parse("dd-MM-yyyy", "01-05-2017")
			 condition = '<'
		}else if(params.filterSelected.toString() == "3"){
			 matchDate = Date.parse("dd-MM-yyyy", "01-05-2017")
		}else if(params.filterSelected.toString() == "4"){
			 matchDate = new Date().clearTime()
			 condition = '='
		}else{
		    params.filterSelected=1
		}
		def r = Prediction.executeQuery("select p.user.id , count(p.id)  from Prediction p where p.predictedPlayer = p.leagueMatch.winner and p.leagueMatch.matchDate "+condition+" :dt  group by user  ",[dt:matchDate])
		println r
		def pList = []
		def pMap = [:]
		def role = Role.findByAuthority("ROLE_USER")
		User.list().each{
			def a = UserRole.findByUserAndRole(it,role)
			if(a){
				pMap[it.id] =["name":it.fullName,"count":0]
			}
		}
		r.each{
			pMap[it[0]].count=it[1]
		}
		pList = pMap.collect{it.value}
		pList.sort{x,y->
			y.count <=> x.count
		  }
		def total =  LeagueMatch.executeQuery("Select count(*) from LeagueMatch l where l.isCompleted=:b and l.matchDate "+condition+" :dt  ",[dt:matchDate,b:true])
		[pList:pList,total:total[0], matchDate:matchDate, filterSelected:params.filterSelected,optList:[[id:1,name:'All'],[id:2,name:'FirstHalf'], [id:3,name:'SecondHalf'], [id:4,name:'Daily']]]
	}
}
