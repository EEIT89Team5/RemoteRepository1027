package com.iii.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chatroomServerEndpoint")
public class ChatroomServerEndpoint {
  static Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
  @OnOpen
  public void handleOpen(Session userSession){
      chatroomUsers.add(userSession);
  }
  @OnMessage
  public void handleMessage(String message,Session userSession) throws IOException{
//	String username=(String) userSession.getUserProperties().get("username");  
//    if(username==null){
//    	 userSession.getUserProperties().put("username", message);
//    	 userSession.getBasicRemote().sendText(buildJsonData("System","與出餐口同步....." +message));	
//    }else{
    	Iterator<Session> iterator = chatroomUsers.iterator();//及何轉換為了使用下面的迴圈
    	
        while (iterator.hasNext()){
        	iterator.next().getBasicRemote().sendText(message);
        }
//    }
  }
  @OnClose
  public void handleClose(Session userSession){
	  chatroomUsers.remove(userSession);
  }
}