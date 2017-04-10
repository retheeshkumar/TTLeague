package com.fms.ttleague

class Game {

	Integer playerHomePoints
	Integer playerAwayPoints
	Player winner
	static belongsTo = [leagueMatch:LeagueMatch]
    static constraints = {
    }
	@Override
	String toString() {
		"* "+playerHomePoints + "-"+playerAwayPoints
	}
}
