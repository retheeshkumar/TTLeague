
<%@ page import="com.fms.ttleague.Prediction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prediction.label', default: 'Prediction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prediction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prediction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="prediction.predictedPlayer.label" default="Predicted Player" /></th>
					
						<th><g:message code="prediction.leagueMatch.label" default="League Match" /></th>
					
						<th><g:message code="prediction.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${predictionInstanceList}" status="i" var="predictionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${predictionInstance.id}">${fieldValue(bean: predictionInstance, field: "predictedPlayer")}</g:link></td>
					
						<td>${fieldValue(bean: predictionInstance, field: "leagueMatch")}</td>
					
						<td>${fieldValue(bean: predictionInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${predictionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
