package websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class BroadSocket {
	public static Set<Session> clients =  Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage // 클라이언드로부터 메시지가 도착했을때
	public void onMessage(String message, Session session) throws Exception{
		System.out.println("클라이언트로부터 새로운 메시지 : " + message);
		synchronized(clients) {
			for(Session clients : clients) { 
				if(!clients.equals(session)) { // 보낸 session을 제외한 모두에게 message 발송
					clients.getBasicRemote().sendText(message);
				}
			}
		} // synchronized
		
	}
	
	@OnOpen // 새로운 클라이언트가 서버로 접속했을때
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("참여 : " + clients.size() + "명.");
	}
	
	@OnClose // 클라이언트이 접속이 끊어졌을때
	public void onClose(Session session) {
		clients.remove(session);
	}
}
