package com.eleyuan.action;

import org.junit.Test;

import com.eleyuan.bean.Message;

public class MessageActionTest {

	@Test
	public void test(){
		Message me=new Message();
		
		me.setReciever("zhang");
		me.setUsername("xu");
		me.setContent("jjjjjjjjjjjjjjjjjj");
		
		MessageAction mess=new MessageAction();
		mess.add();
	}
	
	
}
