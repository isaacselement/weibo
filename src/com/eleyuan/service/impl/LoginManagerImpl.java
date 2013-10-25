package com.eleyuan.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.eleyuan.bean.Member;
import com.eleyuan.service.LoginManager;
import com.eleyuan.service.MemberManager;
import com.eleyuan.util.MD5;


@Service
public class LoginManagerImpl implements LoginManager {
	@Inject
	private MemberManager memberManager;// ��Ա�����Զ���


	public Member login(String username, String password) {
		
		List<Member> list = memberManager.findMemberByName(username);// ͨ�����ֲ��ҳ�Ա
		for (Member member : list) {
/*			String passwd = MD5.encoderByMd5(password);// ���ܺ��ٽ��жԱ�
*/			if (member.getPassword().trim().equals(password))
				return member;
		}
		return null;
			
		} 

	}
