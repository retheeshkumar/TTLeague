<%@ page import="com.fms.ttleague.LeagueMatch" %>



<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerHomeSets', 'error')} ">
	<label for="playerHomeSets">
		<g:message code="leagueMatch.playerHomeSets.label" default="Player Home Sets" />
		
	</label>
	<g:field name="playerHomeSets" type="number" value="${leagueMatchInstance.playerHomeSets}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerAwaySets', 'error')} ">
	<label for="playerAwaySets">
		<g:message code="leagueMatch.playerAwaySets.label" default="Player Away Sets" />
		
	</label>
	<g:field name="playerAwaySets" type="number" value="${leagueMatchInstance.playerAwaySets}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'winner', 'error')} ">
	<label for="winner">
		<g:message code="leagueMatch.winner.label" default="Winner" />
		
	</label>
	<g:select id="winner" name="winner.id" from="${com.fms.ttleague.Player.list()}" optionKey="id" value="${leagueMatchInstance?.winner?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'matchDate', 'error')} ">
	<label for="matchDate">
		<g:message code="leagueMatch.matchDate.label" default="Match Date" />
		
	</label>
	<g:datePicker name="matchDate" precision="day"  value="${leagueMatchInstance?.matchDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'referee', 'error')} ">
	<label for="referee">
		<g:message code="leagueMatch.referee.label" default="Referee" />
		
	</label>
	<g:select id="referee" name="referee.id" from="${com.fms.auth.User.list()}" optionKey="id" value="${leagueMatchInstance?.referee?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'games', 'error')} ">
	<label for="games">
		<g:message code="leagueMatch.games.label" default="Games" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${leagueMatchInstance?.games?}" var="g">
    <li><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="game" action="create" params="['leagueMatch.id': leagueMatchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'game.label', default: 'Game')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'isCompleted', 'error')} ">
	<label for="isCompleted">
		<g:message code="leagueMatch.isCompleted.label" default="Is Completed" />
		
	</label>
	<g:checkBox name="isCompleted" value="${leagueMatchInstance?.isCompleted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerAway', 'error')} required">
	<label for="playerAway">
		<g:message code="leagueMatch.playerAway.label" default="Player Away" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="playerAway" name="playerAway.id" from="${com.fms.ttleague.Player.list()}" optionKey="id" required="" value="${leagueMatchInstance?.playerAway?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerHome', 'error')} required">
	<label for="playerHome">
		<g:message code="leagueMatch.playerHome.label" default="Player Home" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="playerHome" name="playerHome.id" from="${com.fms.ttleague.Player.list()}" optionKey="id" required="" value="${leagueMatchInstance?.playerHome?.id}" class="many-to-one"/>

</div>

