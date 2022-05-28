package com.example.forum.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Stack;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Topic {
    private int id;
    private String title;
    private String description;
    private LocalDateTime date;
    private Optional<UserEntity> user;
    private String idForum;
    private int numberRe;
    private Stack<Message> messages;


}
