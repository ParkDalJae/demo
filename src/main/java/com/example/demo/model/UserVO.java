package com.example.demo.model;

public class UserVO {
    private int no;
    private String name;
    private int number;
    private String id;
    private int totMoney;
    private int currentScore;

    // 기본 생성자
    public UserVO() {
    }

    // 모든 필드를 포함하는 생성자
    public UserVO(int no, String name, int number, String id, int totMoney, int currentScore) {
        this.no = no;
        this.name = name;
        this.number = number;
        this.id = id;
        this.totMoney = totMoney;
        this.currentScore = currentScore;
    }

    // getter와 setter 메서드들
    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTotMoney() {
        return totMoney;
    }

    public void setTotMoney(int totMoney) {
        this.totMoney = totMoney;
    }

    public int getCurrentScore() {
        return currentScore;
    }

    public void setCurrentScore(int currentScore) {
        this.currentScore = currentScore;
    }
}
