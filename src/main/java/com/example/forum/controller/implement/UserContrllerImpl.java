package com.example.forum.controller.implement;

import com.example.forum.controller.UserController;
import com.example.forum.entity.*;
import com.example.forum.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Controller
public class UserContrllerImpl implements UserController {


    private ForumData forumData = new ForumData();
    @Autowired
    private ForumService forumService;

    @Override
    public String login() {
        return "Login";
    }

    @Override
    public String checkUser(Model model, String name, String password, HttpSession session) {

        HashMap<String, User> userHashMap = new HashMap<>();
        List<UserEntity> userEntities = forumService.getUsers();
        forumData.setMapUser(userEntities);

        User user = forumData.checkUser(name,password);

        if (user!=null){
            session.setAttribute("User",user);
            model.addAttribute("user",user);
            return getTopics(model,session);
        }else{
            return "Login";
        }
    }

    @Override
    public String getTopics(Model model,HttpSession session) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        List<TopicEntity> topicEntities = forumService.getTopics();
        List<Topic> topics = new ArrayList<>();
        for(TopicEntity topic: topicEntities){
            Topic topic1 = new Topic();
            topic1.setId(topic.getId());
            topic1.setDate(topic.getDate());
            topic1.setDescription(topic.getDescription());
            topic1.setUser(getUserById(topic.getIduser()));
            topic1.setIdForum(topic.getIdforum());
            topic1.setTitle(topic.getTitle());
            topic1.setNumberRe(forumService.getNumberMessage(String.valueOf(topic.getId())));
            topics.add(topic1);

        }

        model.addAttribute("topics",topics);
        return "ListTopic";
    }

    @Override
    public String logout(HttpSession session) {
        session.removeAttribute("User");
        return "Login";
    }


    @Override
    public String getTopic(Model model, String id,HttpSession session) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        Optional<TopicEntity> topic = forumService.getTopicById(id);

        if (topic.isPresent()){
            Topic topic1 = new Topic();
            topic1.setId(topic.get().getId());
            topic1.setDate(topic.get().getDate());
            topic1.setDescription(topic.get().getDescription());
            topic1.setUser(getUserById(topic.get().getIduser()));
            topic1.setIdForum(topic.get().getIdforum());
            topic1.setTitle(topic.get().getTitle());
            topic1.setNumberRe(forumService.getNumberMessage(id));

            List<Message> messageEntities = getMessage(String.valueOf(topic.get().getId()));
            model.addAttribute("messages",messageEntities);
            model.addAttribute("topic",topic1);
            return "ShowTopic";
        }
        return getTopics(model,session);
    }

    @Override
    public String getReplyTopic(Model model,String id,String title,HttpSession session) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        model.addAttribute("id",id);
        model.addAttribute("title",title.replace("Re:",""));
        return "ReplyTopic";
    }

    @Override
    public String saveReplyTopic(String id, String title,String content,HttpSession session,Model model) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        MessageEntity message = new MessageEntity();
        message.setContent(content);
        message.setCreateTime(LocalDateTime.now());
        message.setCreator(user.getId());
        message.setTitle(title);
        message.setIdtopic(id);

        forumService.saveNewReply(message);

        return getTopics(model,session);
    }

    @Override
    public String newTopic(String id,Model model,HttpSession session) {
        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }
        model.addAttribute("id",id);
        return "NewTopic";
    }

    @Override
    public String saveTopic(String title, String description, String id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");


        if (user == null){
            return login();
        }

        TopicEntity topic = new TopicEntity();

        topic.setDate(LocalDateTime.now());
        topic.setDescription(description);
        topic.setTitle(title);
        topic.setIduser(user.getId());
        topic.setIdforum(id);

        forumService.saveNewTopic(topic);

        return getTopics(model,session);
    }

    @Override
    public String getAllTopicById(Model model, HttpSession session) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        List<TopicEntity> topicEntities = forumService.getAllTopicByIDUser(user.getId());

        model.addAttribute("topics",topicEntities);

        return "Account";
    }

    @Override
    public String deleteTopics(Model model, String listId,HttpSession session) {

        User user = (User) session.getAttribute("User");

        if (user == null){
            return login();
        }

        forumService.deleteTopics(listId);

        return getAllTopicById(model,session);
    }

    public List<Message> getMessage(String id){

        List<MessageEntity> messageEntities = forumService.getMessages(id);

        List<Message> messages = new ArrayList<>();

        for(MessageEntity m: messageEntities){
            Message message = new Message();
            message.setId(m.getId());
            message.setContent(m.getContent());
            message.setCreator(getUserById(m.getCreator()));
            message.setTitle(m.getTitle());
            message.setCreatedTime(m.getCreateTime());
            message.setIdTopic(m.getIdtopic());
            messages.add(message);
        }

        return messages;
    }
    public Optional<UserEntity> getUserById(String id){
        return forumService.getUserById(id);
    }

}
