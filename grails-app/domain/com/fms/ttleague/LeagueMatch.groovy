package com.fms.ttleague
import com.fms.auth.User

class LeagueMatch {
	
	Player playerHome
	Player playerAway
	Date matchDate
	Integer playerHomeSets
	Integer playerAwaySets
	Player winner
	User referee
	Boolean isCompleted

	static hasMany = [games:Game]
	static mapping = {
		isCompleted defaultValue: true
  }
    static constraints = {
		playerHomeSets nullable : true
		playerAwaySets nullable : true
		winner nullable : true
		matchDate nullable : true
		referee nullable : true
    }
	
	@Override
	String toString() {
		playerHome.playerName +" -Vs- "+playerAway.playerName
	}
}
