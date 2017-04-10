<%@ page import="com.fms.ttleague.Player" %>



<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'seed', 'error')} ">
	<label for="seed">
		<g:message code="player.seed.label" default="Seed" />
		
	</label>
	<g:field name="seed" type="number" value="${playerInstance.seed}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'playerName', 'error')} required">
	<label for="playerName">
		<g:message code="player.playerName.label" default="Player Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="playerName" required="" value="${playerInstance?.playerName}"/>

</div>

