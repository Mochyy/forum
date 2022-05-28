package com.example.forum.entity;

import com.example.forum.service.ForumService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Autowired
    private ForumService forumService;
    private String id;
    private String username;
    private String password;
    private String email;
    private LocalDate joinDate;
    private List<Message> messages;


    public UserEntity getUserById(String id){
        List<UserEntity> userEntities = forumService.getUsers();
        for ( UserEntity u : userEntities    ) {
            if (u.getId().equals(id)){
                return u;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return "User{" +
                "forumService=" + forumService +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", joinDate=" + joinDate +
                ", messages=" + messages +
                '}';
    }
}
