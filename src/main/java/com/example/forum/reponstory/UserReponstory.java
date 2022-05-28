package com.example.forum.reponstory;

import com.example.forum.entity.TopicEntity;
import com.example.forum.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserReponstory extends JpaRepository<UserEntity,String> {
    List<UserEntity> findAll();
    Optional<UserEntity> findById(String id);

}
