package com.example.forum.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Optional;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private int id;
    private String title;
    private LocalDateTime createdTime;
    private String content;
    private Optional<UserEntity> creator;
    private String idTopic;
}
