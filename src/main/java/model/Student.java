package model;

public class Student {
    String name;
    String prn;
    String email;
    String phone;
    String course;
    String branch;
    String year;
    String room_number;
    String allot_date;

    public Student() {
    }

    public Student(String name, String prn, String email, String phone, String course, String branch, String year, String room_number, String allot_date) {
        this.name = name;
        this.prn = prn;
        this.email = email;
        this.phone = phone;
        this.course = course;
        this.branch = branch;
        this.year = year;
        this.room_number = room_number;
        this.allot_date = allot_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getRoom_number() {
        return room_number;
    }

    public void setRoom_number(String room_number) {
        this.room_number = room_number;
    }

    public String getAllot_date() {
        return allot_date;
    }

    public void setAllot_date(String allot_date) {
        this.allot_date = allot_date;
    }
}
