package com.springmvc.entity;

import java.util.ArrayList;
import java.util.List;

//将java实体转换成easyUI Tree所需json类型
public class TreeData {
    private Integer id;
    private String text;
    private String attributes;
    private String state;
    private boolean checked;
    private List<TreeData> children;
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public String getAttributes() {
        return attributes;
    }
    public void setAttributes(String attributes) {
        this.attributes = attributes;
    }
    public List<TreeData> getChildren() {
        return children;
    }
    public void setChildren(List<TreeData> children) {
        this.children = children;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public boolean isChecked() {
        return checked;
    }
    public void setChecked(boolean checked) {
        this.checked = checked;
    }
    public TreeData() {
        this.children=new ArrayList<>();
    }

}
