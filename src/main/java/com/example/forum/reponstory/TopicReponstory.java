package com.example.forum.reponstory;

import com.example.forum.entity.TopicEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface TopicReponstory extends JpaRepository<TopicEntity,String> {
    List<TopicEntity> findAll();
    Optional<TopicEntity> findById(int id);
    TopicEntity save(TopicEntity topic);
    List<TopicEntity> findAllByIduser(String id);
    void deleteAllById(int listId);
}
