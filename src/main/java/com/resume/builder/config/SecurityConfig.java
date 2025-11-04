package com.resume.builder.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // This part is important for platforms like Railway that use a proxy
//            .requiresChannel(channel -> channel
//                .requestMatchers(r -> r.getHeader("X-Forwarded-Proto") != null)
//                .requiresSecure()
           // )
            .authorizeHttpRequests(auth -> auth
                // *** THIS IS THE FIX ***
                // Permit all internal FORWARD requests, which are used for rendering JSP views.
                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                
                // Allow public access to specific pages and static resources
                .requestMatchers("/", "/login", "/register", "/register-success", 
                               "/error", "/css/**", "/js/**", "/images/**", 
                               "/favicon.ico").permitAll()
                
                // All other requests must be authenticated
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/dashboard", true)
                .failureUrl("/login?error=true")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/login?logout=true")
                .permitAll()
            );
        
        return http.build();
    }
}

