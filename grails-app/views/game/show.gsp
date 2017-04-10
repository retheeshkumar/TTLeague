
<%@ page import="com.fms.ttleague.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-game" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list game">
			
				<g:if test="${gameInstance?.leagueMatch}">
				<li class="fieldcontain">
					<span id="leagueMatch-label" class="property-label"><g:message code="game.leagueMatch.label" default="League Match" /></span>
					
						<span class="property-value" aria-labelledby="leagueMatch-label"><g:link controller="leagueMatch" action="show" id="${gameInstance?.leagueMatch?.id}">${gameInstance?.leagueMatch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.playerAwayPoints}">
				<li class="fieldcontain">
					<span id="playerAwayPoints-label" class="property-label"><g:message code="game.playerAwayPoints.label" default="Player Away Points" /></span>
					
						<span class="property-value" aria-labelledby="playerAwayPoints-label"><g:fieldValue bean="${gameInstance}" field="playerAwayPoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.playerHomePoints}">
				<li class="fieldcontain">
					<span id="playerHomePoints-label" class="property-label"><g:message code="game.playerHomePoints.label" default="Player Home Points" /></span>
					
						<span class="property-value" aria-labelledby="playerHomePoints-label"><g:fieldValue bean="${gameInstance}" field="playerHomePoints"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameInstance?.winner}">
				<li class="fieldcontain">
					<span id="winner-label" class="property-label"><g:message code="game.winner.label" default="Winner" /></span>
					
						<span class="property-value" aria-labelledby="winner-label"><g:link controller="player" action="show" id="${gameInstance?.winner?.id}">${gameInstance?.winner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:gameInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${gameInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
