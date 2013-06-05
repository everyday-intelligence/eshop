package com.jiren.eshop.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.AbstractAuthenticationFailureEvent;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.memory.InMemoryDaoImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



@Service("LockoutDetailsService")
	public class LockoutDetailsServiceImpl extends InMemoryDaoImpl implements ApplicationListener<ApplicationEvent> {
	private static final transient Log logger = LogFactory.getLog(LockoutDetailsServiceImpl.class);
	private static final int DEFAULT_MAX_ATTEMPTS = 3;
	private static final long DEFAULT_LOCKOUT_SECONDS = 60;

	private Map<String, LockoutData> lockMap = new HashMap<String, LockoutData>();

	private static class LockoutData {
	int attempts;
	long lastMillis;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
	UserDetails details = super.loadUserByUsername(username);
	if (isLockedOut(username)) {
	details = new User(details.getUsername(), details.getPassword(), details.isEnabled(), details
	.isAccountNonExpired(), details.isCredentialsNonExpired(), false, details.getAuthorities());
	}
	return details;
	}

	private LockoutData getData(String username) {
	LockoutData data = lockMap.get(username);
	if (data == null) {
	data = new LockoutData();
	lockMap.put(username, data);
	}
	return data;
	}

	private boolean isLockedOut(String username) {
	LockoutData data = getData(username);
	if (data.attempts >= DEFAULT_MAX_ATTEMPTS) {
	long last = System.currentTimeMillis() - data.lastMillis;
	if (last < 1000 * DEFAULT_LOCKOUT_SECONDS) {
	return true;
	}
	}
	return false;
	}

	public void onApplicationEvent(ApplicationEvent event) {
	if (event instanceof AuthenticationSuccessEvent) {
	registerSuccessLogin(((AbstractAuthenticationEvent ) event).getAuthentication().getName());
	} else if (event instanceof AbstractAuthenticationFailureEvent) {
	String username = ((AbstractAuthenticationFailureEvent) event).getAuthentication().getName();
	String origin = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest()
	.getRemoteAddr();
	String cause = ((AbstractAuthenticationFailureEvent) event).getException().toString();
	logger.info("Failed authentication for user '" + username + "' from ip " + origin + " caused by " + cause);
	if (event instanceof AuthenticationFailureBadCredentialsEvent) {
	registerFailedLogin(username, event.getTimestamp());
	}
	}
	}

	private void registerSuccessLogin(String username) {
	LockoutData data = getData(username);
	data.attempts = 0;
	}

	private void registerFailedLogin(String username, long timestamp) {
	if (!isLockedOut(username)) {
	LockoutData data = getData(username);
	data.attempts++;
	data.lastMillis = timestamp;
	}
	}
		
		
}

