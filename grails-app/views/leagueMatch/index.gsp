
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
			 <g:form>
			 <div style="float:right">
                  <g:select id="selectedPlayer" name="selectedPlayerId" from="${pList}" optionKey="id" optionValue="playerName" value="${selectedPlayerId}" class="many-to-one"/>
                  <span class="simple"><g:actionSubmit class="editar" action="index" value="FilterByPlayer" /></span>
              </div>
              </g:form>
			<table>
			<thead>
					<tr>
					<g:sortableColumn property="id" title="${message(code: 'leagueMatch.id.label', default: 'Match Id')}" />
					<g:sortableColumn property="playerHome" title="${message(code: 'leagueMatch.playerHome.label', default: 'Player Home')}" />
					<g:sortableColumn property="playerAway" title="${message(code: 'leagueMatch.playerAway.label', default: 'Player Away')}" />
					<th>Score(Home-Away)</th>
					
						<th><g:message code="leagueMatch.winner.label" default="Winner" /></th>
					
						<g:sortableColumn property="matchDate" title="${message(code: 'leagueMatch.matchDate.label', default: 'Match Date')}" />
					
						<th><g:message code="leagueMatch.referee.label" default="Referee" /></th>
					
						<g:sortableColumn property="isCompleted" title="Match Status" />
					
					<sec:ifLoggedIn>
						    <sec:ifAllGranted roles="ROLE_USER">
						    	<g:sortableColumn property="isCompleted" title="Your Prediction" />
						     </sec:ifAllGranted>
						</sec:ifLoggedIn>
					</tr>
				</thead>
				<tbody>
				<g:each in="${leagueMatchInstanceList}" status="i" var="leagueMatchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${leagueMatchInstance.id}">${fieldValue(bean: leagueMatchInstance, field: "id")}</g:link></td>
					
					<td>${fieldValue(bean: leagueMatchInstance, field: "playerHome")}</td>
					<td>${fieldValue(bean: leagueMatchInstance, field: "playerAway")}</td>
					<td>${leagueMatchInstance.playerHomeSets}-${leagueMatchInstance.playerAwaySets}
					   ${ leagueMatchInstance.games?leagueMatchInstance.games.sort{ it.id }:'-'}
					   <%--<g:each in="${leagueMatchInstance.games}" status="j" var="s">
					   (${s.playerHomePoints}-${s.playerAwayPoints})
					   </g:each> 
					--%></td>
					
						<td>${fieldValue(bean: leagueMatchInstance, field: "winner")}</td>
					
						<td><g:formatDate format="dd-MM-yyyy" date="${leagueMatchInstance.matchDate}" /></td>
					
						<td>${fieldValue(bean: leagueMatchInstance, field: "referee")}</td>
					
						<td style="color:${leagueMatchInstance.isCompleted == true ?' #da3c1a':' #1a34c8'}">${leagueMatchInstance.isCompleted == true ? 'Completed':'Upcoming'}</td>
					
					<sec:ifLoggedIn>
						    <sec:ifAllGranted roles="ROLE_USER">
						        <td style="color: ${leagueMatchInstance?.winner != null && pred[leagueMatchInstance.id]?.predictedPlayer?.id == leagueMatchInstance?.winner?.id?'BLUE':'RED'}">
							        <g:if test="${false == leagueMatchInstance.isCompleted}">
									     <g:link controller="prediction" action="editPrediction" id="${pred[leagueMatchInstance.id].id}">${pred[leagueMatchInstance.id]?pred[leagueMatchInstance.id].predictedPlayer?pred[leagueMatchInstance.id].predictedPlayer.playerName:'Predict':'Predict'}</g:link>
									</g:if>
									<g:else>
									    ${pred[leagueMatchInstance.id]?pred[leagueMatchInstance.id].predictedPlayer?pred[leagueMatchInstance.id].predictedPlayer.playerName:'Not Predicted':'Not Predicted'}
									</g:else>
							    	    
						    	</td>
						     </sec:ifAllGranted>
						</sec:ifLoggedIn>
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
