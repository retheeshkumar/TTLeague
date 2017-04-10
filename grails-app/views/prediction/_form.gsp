<%@ page import="com.fms.ttleague.Prediction" %>



<div class="fieldcontain ${hasErrors(bean: predictionInstance, field: 'predictedPlayer', 'error')} ">
	<label for="predictedPlayer">
		<g:message code="prediction.predictedPlayer.label" default="Predicted Player" />
		
	</label>
	<g:select id="predictedPlayer" name="predictedPlayer.id" from="${com.fms.ttleague.Player.list()}" optionKey="id" value="${predictionInstance?.predictedPlayer?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: predictionInstance, field: 'leagueMatch', 'error')} required">
	<label for="leagueMatch">
		<g:message code="prediction.leagueMatch.label" default="League Match" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leagueMatch" name="leagueMatch.id" from="${com.fms.ttleague.LeagueMatch.list()}" optionKey="id" required="" value="${predictionInstance?.leagueMatch?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: predictionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="prediction.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.fms.auth.User.list()}" optionKey="id" required="" value="${predictionInstance?.user?.id}" class="many-to-one"/>

</div>

