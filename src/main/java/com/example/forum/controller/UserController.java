package com.example.forum.controller;

import com.example.forum.entity.UserEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@RequestMapping
public interface UserController {
    @GetMapping("/")
    public String login();
    @PostMapping("/login")
    public String checkUser(Model model, @RequestParam String name, @RequestParam String password, HttpSession session);
    @GetMapping("/topics")
    public String getTopics(Model model);
//    @GetMapping("/getUserById")
//    public Optional<UserEntity> getUserById(Model model, @RequestParam String id);
    @GetMapping("/logout")
    public String logout(HttpSession session);
    @GetMapping("/topic/{id}")
    public String getTopic(Model model, @PathVariable String id);
    @GetMapping("/newReplyTopic/{id}")
    public String getReplyTopic(Model model,@PathVariable String id);
    @PostMapping("/newReplyTopic")
    public String saveReplyTopic(@RequestParam String id,@RequestParam String title,@RequestParam String content,HttpSession session,Model model);
    @GetMapping("/newTopic/{id}")
    public String newTopic(@PathVariable String id,Model model);
    @PostMapping("/newTopic")
    public String saveTopic(@RequestParam String title,@RequestParam String description,String id,HttpSession session,Model model);
    @GetMapping("/getTopicById")
    public String getAllTopicById(Model model,HttpSession session);
    @GetMapping("/deleteTopic")
    public String deleteTopics(Model model,@RequestParam String listId,HttpSession session);

}
