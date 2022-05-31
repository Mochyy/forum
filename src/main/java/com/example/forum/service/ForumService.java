package com.example.forum.service;

import com.example.forum.entity.MessageEntity;
import com.example.forum.entity.TopicEntity;
import com.example.forum.entity.UserEntity;
import com.example.forum.reponstory.MessageReponstory;
import com.example.forum.reponstory.TopicReponstory;
import com.example.forum.reponstory.UserReponstory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ForumService {

    @Autowired
    UserReponstory userReponstory;
    @Autowired
    TopicReponstory topicReponstory;
    @Autowired
    MessageReponstory messageReponstory;

    public List<UserEntity> getUsers(){
        return userReponstory.findAll();
    }

    public List<TopicEntity> getTopics(){return topicReponstory.findAll();}

    public Optional<UserEntity> getUserById(String id){ return userReponstory.findById(id);}

    public Optional<TopicEntity> getTopicById(String id){return topicReponstory.findById(Integer.parseInt(id));}

    public List<MessageEntity> getMessages(String id){return messageReponstory.findByIdtopic(id);}

    public int getNumberMessage(String id) {return messageReponstory.getNumberMessage(id);}

    public MessageEntity saveNewReply(MessageEntity message){return messageReponstory.save(message);}

    public TopicEntity saveNewTopic(TopicEntity topic){return topicReponstory.save(topic);}

    public List<TopicEntity> getAllTopicByIDUser(String id){return topicReponstory.findAllByIduser(id);}

    public void deleteTopics(String listId){

        String[] s = listId.split("-");

        for (int i = 0; i < s.length; i++) {
            topicReponstory.deleteAllById(Integer.parseInt(s[i]));
        }

    }

}
