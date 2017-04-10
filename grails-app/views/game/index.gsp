
<%@ page import="com.fms.ttleague.Game" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-game" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-game" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="game.leagueMatch.label" default="League Match" /></th>
					
						<g:sortableColumn property="playerAwayPoints" title="${message(code: 'game.playerAwayPoints.label', default: 'Player Away Points')}" />
					
						<g:sortableColumn property="playerHomePoints" title="${message(code: 'game.playerHomePoints.label', default: 'Player Home Points')}" />
					
						<th><g:message code="game.winner.label" default="Winner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gameInstanceList}" status="i" var="gameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gameInstance.id}">${fieldValue(bean: gameInstance, field: "leagueMatch")}</g:link></td>
					
						<td>${fieldValue(bean: gameInstance, field: "playerAwayPoints")}</td>
					
						<td>${fieldValue(bean: gameInstance, field: "playerHomePoints")}</td>
					
						<td>${fieldValue(bean: gameInstance, field: "winner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gameInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
