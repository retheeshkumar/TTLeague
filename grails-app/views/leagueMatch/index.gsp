
<%@ page import="com.fms.ttleague.LeagueMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'leagueMatch.label', default: 'LeagueMatch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-leagueMatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-leagueMatch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					<g:sortableColumn property="playerHomeSets" title="${message(code: 'leagueMatch.id.label', default: 'Match Id')}" />
					<g:sortableColumn property="playerHomeSets" title="${message(code: 'leagueMatch.playerHome.label', default: 'Player Home')}" />
					<g:sortableColumn property="playerHomeSets" title="${message(code: 'leagueMatch.playerAway.label', default: 'Player Away')}" />
					<g:sortableColumn property="playerHomeSets" title="${message(code: 'leagueMatch.playerHomeSets.label', default: 'Player Home Sets')}" />
					
						<g:sortableColumn property="playerAwaySets" title="${message(code: 'leagueMatch.playerAwaySets.label', default: 'Player Away Sets')}" />
					
						<th><g:message code="leagueMatch.winner.label" default="Winner" /></th>
					
						<g:sortableColumn property="matchDate" title="${message(code: 'leagueMatch.matchDate.label', default: 'Match Date')}" />
					
						<th><g:message code="leagueMatch.referee.label" default="Referee" /></th>
					
						<g:sortableColumn property="isCompleted" title="${message(code: 'leagueMatch.isCompleted.label', default: 'Is Completed')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${leagueMatchInstanceList}" status="i" var="leagueMatchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${leagueMatchInstance.id}">${fieldValue(bean: leagueMatchInstance, field: "id")}</g:link></td>
					
					<td>${fieldValue(bean: leagueMatchInstance, field: "playerHome")}</td>
					<td>${fieldValue(bean: leagueMatchInstance, field: "playerAway")}</td>
					<td>${fieldValue(bean: leagueMatchInstance, field: "playerHomeSets")}</td>
						<td>${fieldValue(bean: leagueMatchInstance, field: "playerAwaySets")}</td>
					
						<td>${fieldValue(bean: leagueMatchInstance, field: "winner")}</td>
					
						<td><g:formatDate date="${leagueMatchInstance.matchDate}" /></td>
					
						<td>${fieldValue(bean: leagueMatchInstance, field: "referee")}</td>
					
						<td><g:formatBoolean boolean="${leagueMatchInstance.isCompleted}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${leagueMatchInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
