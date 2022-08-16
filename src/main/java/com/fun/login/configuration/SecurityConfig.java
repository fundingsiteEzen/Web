package com.fun.login.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.fun.login.service.UserLoginFailHandler;
import com.fun.login.service.UserLoginSuccessHandler;
import com.fun.login.service.UserService;

@Configuration
@EnableWebSecurity(debug=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserService UserService;
	

	@Override
	public void configure(WebSecurity web) throws Exception {
//		super.configure(web);
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.out.println("콘피규어 작동중");
//		super.configure(http);
		http
			.formLogin()
				.usernameParameter("id")
				.passwordParameter("pass")
				.loginPage("/login.do")
				.loginProcessingUrl("/seculogin")
				.defaultSuccessUrl("/", true)
				.failureUrl("/login.do")
				.successHandler(new UserLoginSuccessHandler())
				.failureHandler(new UserLoginFailHandler())
			.and()
				.authorizeRequests()
				.antMatchers("/").permitAll()
				.antMatchers("/myPage/myInfo").hasRole("USER")
				.antMatchers("/manager.do").hasRole("ADMIN")
			.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/")
			.and()
				.csrf().disable();
		http.cors().and();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		super.configure(auth);
		auth.inMemoryAuthentication()
			.withUser("id01")
			.password("{noop}1111")
			.authorities("USER")
			.and()
			.withUser("admin")
			.password("{noop}1234")
			.authorities("ADMIN", "USER");
	}

	
}
