package springSecurity;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


import dao.UserDAO;
import model.User;
@Configuration
@EnableWebSecurity
public class SpringConfiguration extends WebSecurityConfigurerAdapter {
	
	
    @Bean
    public RestorationCodeFilter restorationCodeFilter() {
        return new RestorationCodeFilter();
    }
    
	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
          http
          .authorizeRequests()
          .antMatchers("/home.jsp").permitAll()
          .antMatchers("/index").permitAll()
          .antMatchers("/codeVerification").permitAll()
          .antMatchers("/changePassword").permitAll()
          .antMatchers("/Email/Exists").permitAll()
          .antMatchers("/User/Details").permitAll()
          .antMatchers("/Authority/Granting").permitAll()
          .antMatchers("/Password/Changing").permitAll()
          .anyRequest().authenticated()
          .and()
          .formLogin()
          .loginPage("/home.jsp")
          .usernameParameter("username")
          .passwordParameter("password")
          .defaultSuccessUrl("/main")
          .failureUrl("/home.jsp?error=true")
          .and()
          .csrf().disable();
	    }

	    @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
         System.out.println("Charging");
	     UserDAO userDAO=new UserDAO();
	     ArrayList<User> users=userDAO.getAll();
	     for(User user:users) {
	    	 auth.inMemoryAuthentication()
	    	 .withUser(user.getEmail())
	    	 .password("{noop}"+user.getPassword())
	    	 .roles("USER");
	       }
	    }
}
