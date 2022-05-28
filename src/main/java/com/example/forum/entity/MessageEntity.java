package com.example.forum.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "message", schema = "forum", catalog = "")
public class MessageEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "title")
    private String title;
    @Basic
    @Column(name = "createTime")
    private LocalDateTime createTime;
    @Basic
    @Column(name = "content")
    private String content;
    @Basic
    @Column(name = "creator")
    private String creator;
    @Basic
    @Column(name = "idtopic")
    private String idtopic;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getIdtopic() {
        return idtopic;
    }

    public void setIdtopic(String idtopic) {
        this.idtopic = idtopic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MessageEntity that = (MessageEntity) o;
        return id == that.id && Objects.equals(title, that.title) && Objects.equals(createTime, that.createTime) && Objects.equals(content, that.content) && Objects.equals(creator, that.creator) && Objects.equals(idtopic, that.idtopic);
    }

    @Override
    public String toString() {
        return "MessageEntity{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", createTime=" + createTime +
                ", content='" + content + '\'' +
                ", creator='" + creator + '\'' +
                ", idtopic='" + idtopic + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, createTime, content, creator, idtopic);
    }
}
