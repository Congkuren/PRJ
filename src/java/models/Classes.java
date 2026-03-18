/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author DELL
 */
public class Classes {
    private int class_id;
    private String class_nameString;
    private int teacher_id;
    private String scheduleString;
    private String romm;

    public Classes() {
    }

    public Classes(int class_id, String class_nameString, int teacher_id, String scheduleString, String romm) {
        this.class_id = class_id;
        this.class_nameString = class_nameString;
        this.teacher_id = teacher_id;
        this.scheduleString = scheduleString;
        this.romm = romm;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_nameString() {
        return class_nameString;
    }

    public void setClass_nameString(String class_nameString) {
        this.class_nameString = class_nameString;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getScheduleString() {
        return scheduleString;
    }

    public void setScheduleString(String scheduleString) {
        this.scheduleString = scheduleString;
    }

    public String getRomm() {
        return romm;
    }

    public void setRomm(String romm) {
        this.romm = romm;
    }
    
    
}
