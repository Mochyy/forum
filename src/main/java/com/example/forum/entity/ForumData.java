package com.example.forum.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor

public class ForumData {
    private Map<String, User> users;
    private List<Forum> forums;

    public ForumData(){
        users = new HashMap<>();
        forums = new ArrayList<>();
    }

    public User checkUser(String name,String password){
        for ( String s: users.keySet()) {
            if (users.get(s).getUsername().equals(name) && users.get(s).getPassword().equals(password)){
                User u = new User();
                u.setId(s);
                u.setPassword(password);
                u.setUsername(name);
                u.setEmail(users.get(s).getEmail());
                u.setJoinDate(users.get(s).getJoinDate());
                return u;
            }
        }
        return null;
    }
    public void setMapUser(List<UserEntity> users){
        for (UserEntity u: users) {
            User user = new User();
            user.setUsername(u.getUsername());
            user.setEmail(u.getEmail());
            user.setPassword(u.getPassword());
            user.setJoinDate(u.getJoinDate());
            user.setMessages(new ArrayList<>());
            this.users.put(u.getId(),user);
        }
    }

}
