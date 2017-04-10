package com.fms.ttleague

class Player {

	String playerName
	Integer seed
    static constraints = {
		seed nullable : true
    }
	@Override
	String toString() {
		playerName
	}
}
