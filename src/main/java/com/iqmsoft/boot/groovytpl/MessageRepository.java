package com.iqmsoft.boot.groovytpl;

public interface MessageRepository {

	Iterable<Message> findAll();
	Message save(Message message);
	Message findMessage(Long id);

}
