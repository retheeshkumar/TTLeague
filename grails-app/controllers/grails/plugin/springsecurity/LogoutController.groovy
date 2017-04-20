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

import javax.servlet.http.HttpServletResponse
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index() {
        println "------------------------------Index logout---------------------------"
		//redirect controller:'login', action: 'index'
		if (!request.post && SpringSecurityUtils.getSecurityConfig().logout.postOnly) {
			println "======Hai----In logout if======"+request.post
			println "======Hai----In logout if======"+SpringSecurityUtils.getSecurityConfig().logout.postOnly
			response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED // 405
			return
		}
		println "======Logout======"+request.post
		session?.invalidate()
		//SecurityContextHolder.getContext()?.getAuthentication()?.setAuthenticated(false);
		//SecurityContextHolder.clearContext()
		// TODO put any pre-logout code here
		//redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
		redirect (controller: 'login' , action: 'index')
	}
}
