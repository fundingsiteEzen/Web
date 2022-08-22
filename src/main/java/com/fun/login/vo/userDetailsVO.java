package com.fun.login.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


// UserDetails 인터페이스를 구현하면 7개의 메서드를 오버라이드 해야함
public class userDetailsVO implements UserDetails{

	private static final long serialVersionUID = 1L;
	
	// 멤버변수
	private String username; // 아이디
	private String password; // 비밀번호
	private List<GrantedAuthority> authorities; // 이게 뭐지 ?!?!? >> 권한 모아 놓는것. ROLE_USER, ROLE_ADMIN 등등
	
	// set 메서드(따로 만들어줌)
	public void setUsername(String username) { this.username = username; }
	public void setPassword(String password) { this.password = password; }
	public void setAuthorities(List<String> authList) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for(int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}
		this.authorities = authorities;
	}
	
	// get 메서드
	// 아이디
	@Override
	public String getUsername() {
		return username;
	}
	// 비밀번호
	@Override
	public String getPassword() {
		return password;
	}
	// 권한
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	// 계정의 만료여부
	@Override
	public boolean isAccountNonExpired() {
		return true; // 만료 안됨
	}

	// 계정의 잠금여부
	@Override
	public boolean isAccountNonLocked() {
		return true; // 안 잠김
	}

	// 패스워드의 만료여부
	@Override
	public boolean isCredentialsNonExpired() {
		return true; // 사용가능
	}

	// 계정 활성화
	@Override
	public boolean isEnabled() {
		return true; // 활성화됨
	}

}
