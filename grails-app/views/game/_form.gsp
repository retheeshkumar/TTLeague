<%@ page import="com.fms.ttleague.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'leagueMatch', 'error')} required">
	<label for="leagueMatch">
		<g:message code="game.leagueMatch.label" default="League Match" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leagueMatch" name="leagueMatch.id" from="${com.fms.ttleague.LeagueMatch.list()}" optionKey="id" required="" value="${gameInstance?.leagueMatch?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'playerAwayPoints', 'error')} required">
	<label for="playerAwayPoints">
		<g:message code="game.playerAwayPoints.label" default="Player Away Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playerAwayPoints" type="number" value="${gameInstance.playerAwayPoints}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'playerHomePoints', 'error')} required">
	<label for="playerHomePoints">
		<g:message code="game.playerHomePoints.label" default="Player Home Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playerHomePoints" type="number" value="${gameInstance.playerHomePoints}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'winner', 'error')} required">
	<label for="winner">
		<g:message code="game.winner.label" default="Winner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="winner" name="winner.id" from="${com.fms.ttleague.Player.list()}" optionKey="id" required="" value="${gameInstance?.winner?.id}" class="many-to-one"/>

</div>

