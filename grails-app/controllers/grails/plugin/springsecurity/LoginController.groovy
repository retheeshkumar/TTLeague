/* Copyright 2013-2015 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package grails.plugin.springsecurity

import grails.converters.JSON

import javax.servlet.http.HttpServletResponse

import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import com.fms.auth.Role
import com.fms.auth.User
@Secured('permitAll')
class LoginController {
	def formatUtilService
	def emailService
	def manageUserService
	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */
	def index() {
		println "===============================Login Index-------54---------------------"+params
		if (springSecurityService.isLoggedIn()) {
			/*def currentLoggedInUser = User.get(springSecurityService.getCurrentUser().id)
			session['lastLogin'] = currentLoggedInUser.lastLogin
			currentLoggedInUser.lastLogin = new Date()
			currentLoggedInUser.save(flush:true)*/
			def roleNames = springSecurityService.getPrincipal().getAuthorities()*.authority
		    redirect (controller: 'dashboard' , action: 'adminDashboard')
			
		}
		else {
			redirect action: 'auth', params: params
		}
	}

	/**
	 * Show the login page.
	 */
	def auth() {
		println "===============================auth=============================="
		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect (controller: 'dashboard' , action: 'adminDashboard')
			return
		}else{
			String view = 'auth'
			String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
			render view: view, model: [postUrl: postUrl,
		                           rememberMeParameter: config.rememberMe.parameter]
	    }
	}
        
        /**
            * Show the forgot password page.
	 */
	def forgotPassword() {
		/*println "===============================Forgot passwordss=============================="+params
		if (params.j_username) {
			CompanyUser cUser=CompanyUser.findBySEmail(params.j_username)
			if (cUser) {
				def uInstance = User.findByUserDetails(cUser)
				def password = manageUserService.resetUserPassword(uInstance)
				emailService.sendMailAsHtml(cUser.sEmail, manageUserService.getResetPwdBody(['userName':uInstance.username,'password':password], cUser, request.siteUrl ), " Password Reset")			
			} else {
				flash.message = message(code:"User Does not exists", args:[params.j_username])
			}
		}*/
	}
        /**
            * Show the forgot password page.
	 */
        def resetPassword() {
			println "===============================reset password=============================="
        }


	/**
	 * The redirect action for Ajax requests.
	 */
	def authAjax() {
		println "===============================ajax=============================="
		response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
		response.sendError HttpServletResponse.SC_UNAUTHORIZED
	}

	/**
	 * Show denied page.
	 */
	def denied() {
		println "===============================denied=============================="
		if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: 'full', params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full() {
		println "===============================full=============================="
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
			        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail() {
		println "==============================authFail=============================="
		String msg = ''
		def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
		if (exception) {
			if (exception instanceof AccountExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.expired")
			}
			else if (exception instanceof CredentialsExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.passwordExpired")
			}
			else if (exception instanceof DisabledException) {
				msg = g.message(code: "springSecurity.errors.login.disabled")
			}
			else if (exception instanceof LockedException) {
				msg = g.message(code: "springSecurity.errors.login.locked")
			}
			else {
				msg = "Invalid Username or Password"//g.message(code: "springSecurity.errors.login.fail")
			}
		}

		if (springSecurityService.isAjax(request)) {
			render([error: msg] as JSON)
		}
		else {
			flash.message = msg
			redirect action: 'auth', params: params
		}
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess() {
		println "===============================ajaxSuccess=============================="
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied() {
		println "===============================ajaxDenied=============================="
		render([error: 'access denied'] as JSON)
	}
}
