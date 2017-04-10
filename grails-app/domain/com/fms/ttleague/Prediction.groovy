package com.fms.ttleague

import com.fms.auth.User

class Prediction {

	LeagueMatch leagueMatch
	User user
	Player predictedPlayer
	
    static constraints = {
		predictedPlayer nullable : true
    }
}
