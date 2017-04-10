
<%@ page import="com.fms.ttleague.Prediction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prediction.label', default: 'Prediction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prediction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prediction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prediction">
			
				<g:if test="${predictionInstance?.predictedPlayer}">
				<li class="fieldcontain">
					<span id="predictedPlayer-label" class="property-label"><g:message code="prediction.predictedPlayer.label" default="Predicted Player" /></span>
					
						<span class="property-value" aria-labelledby="predictedPlayer-label"><g:link controller="player" action="show" id="${predictionInstance?.predictedPlayer?.id}">${predictionInstance?.predictedPlayer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predictionInstance?.leagueMatch}">
				<li class="fieldcontain">
					<span id="leagueMatch-label" class="property-label"><g:message code="prediction.leagueMatch.label" default="League Match" /></span>
					
						<span class="property-value" aria-labelledby="leagueMatch-label"><g:link controller="leagueMatch" action="show" id="${predictionInstance?.leagueMatch?.id}">${predictionInstance?.leagueMatch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predictionInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="prediction.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${predictionInstance?.user?.id}">${predictionInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:predictionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${predictionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
