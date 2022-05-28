package com.example.forum.reponstory;

import com.example.forum.entity.MessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageReponstory extends JpaRepository<MessageEntity,String> {

    List<MessageEntity> findByIdtopic(String id);

    @Query("SELECT COUNT(m.idtopic) FROM MessageEntity m WHERE m.idtopic = ?1")
    int getNumberMessage(String id);
    MessageEntity save(MessageEntity message);

}
