
<%@ page import="com.fms.ttleague.LeagueMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'leagueMatch.label', default: 'LeagueMatch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-leagueMatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-leagueMatch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list leagueMatch">
			
				<g:if test="${leagueMatchInstance?.playerHomeSets}">
				<li class="fieldcontain">
					<span id="playerHomeSets-label" class="property-label"><g:message code="leagueMatch.playerHomeSets.label" default="Player Home Sets" /></span>
					
						<span class="property-value" aria-labelledby="playerHomeSets-label"><g:fieldValue bean="${leagueMatchInstance}" field="playerHomeSets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.playerAwaySets}">
				<li class="fieldcontain">
					<span id="playerAwaySets-label" class="property-label"><g:message code="leagueMatch.playerAwaySets.label" default="Player Away Sets" /></span>
					
						<span class="property-value" aria-labelledby="playerAwaySets-label"><g:fieldValue bean="${leagueMatchInstance}" field="playerAwaySets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.winner}">
				<li class="fieldcontain">
					<span id="winner-label" class="property-label"><g:message code="leagueMatch.winner.label" default="Winner" /></span>
					
						<span class="property-value" aria-labelledby="winner-label"><g:link controller="player" action="show" id="${leagueMatchInstance?.winner?.id}">${leagueMatchInstance?.winner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.matchDate}">
				<li class="fieldcontain">
					<span id="matchDate-label" class="property-label"><g:message code="leagueMatch.matchDate.label" default="Match Date" /></span>
					
						<span class="property-value" aria-labelledby="matchDate-label"><g:formatDate date="${leagueMatchInstance?.matchDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.referee}">
				<li class="fieldcontain">
					<span id="referee-label" class="property-label"><g:message code="leagueMatch.referee.label" default="Referee" /></span>
					
						<span class="property-value" aria-labelledby="referee-label"><g:link controller="user" action="show" id="${leagueMatchInstance?.referee?.id}">${leagueMatchInstance?.referee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.games}">
				<li class="fieldcontain">
					<span id="games-label" class="property-label"><g:message code="leagueMatch.games.label" default="Games" /></span>
					
						<g:each in="${leagueMatchInstance.games}" var="g">
						<span class="property-value" aria-labelledby="games-label"><g:link controller="game" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.isCompleted}">
				<li class="fieldcontain">
					<span id="isCompleted-label" class="property-label"><g:message code="leagueMatch.isCompleted.label" default="Is Completed" /></span>
					
						<span class="property-value" aria-labelledby="isCompleted-label"><g:formatBoolean boolean="${leagueMatchInstance?.isCompleted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.playerAway}">
				<li class="fieldcontain">
					<span id="playerAway-label" class="property-label"><g:message code="leagueMatch.playerAway.label" default="Player Away" /></span>
					
						<span class="property-value" aria-labelledby="playerAway-label"><g:link controller="player" action="show" id="${leagueMatchInstance?.playerAway?.id}">${leagueMatchInstance?.playerAway?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${leagueMatchInstance?.playerHome}">
				<li class="fieldcontain">
					<span id="playerHome-label" class="property-label"><g:message code="leagueMatch.playerHome.label" default="Player Home" /></span>
					
						<span class="property-value" aria-labelledby="playerHome-label"><g:link controller="player" action="show" id="${leagueMatchInstance?.playerHome?.id}">${leagueMatchInstance?.playerHome?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:leagueMatchInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${leagueMatchInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
