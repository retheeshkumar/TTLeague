<%@ page import="com.fms.ttleague.LeagueMatch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'leagueMatch.label', default: 'LeagueMatch')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-leagueMatch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/dashboard/adminDashboard')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-leagueMatch" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${leagueMatchInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${leagueMatchInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:leagueMatchInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${leagueMatchInstance?.version}" />
				<fieldset class="form">
					<%--<g:render template="form"/>
				--%>
				
				<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerHome', 'error')} required">
					<label for="playerHome">
						<g:message code="leagueMatch.playerHome.label" default="Player Home" />
						<span class="required-indicator">*</span>
					</label>
					<label>${leagueMatchInstance?.playerHome}</label>
				
				</div>
				<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'playerAway', 'error')} required">
					<label for="playerAway">
						<g:message code="leagueMatch.playerAway.label" default="Player Away" />
						<span class="required-indicator">*</span>
					</label>
					<label>${leagueMatchInstance?.playerAway}</label>
				
				</div>
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
					<g:select id="winner" name="winner.id" from="${playerList}" optionKey="id" value="${leagueMatchInstance?.winner?.id}" class="many-to-one" noSelection="['null': '']"/>
				
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: leagueMatchInstance, field: 'matchDate', 'error')} ">
					<label for="matchDate">
						<g:message code="leagueMatch.matchDate.label" default="Match Date" />
						
					</label>
					<g:datePicker name="matchDate" precision="day"  value="${leagueMatchInstance?.matchDate?:new Date()}" default="none" noSelection="['': '']" />
				
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

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
