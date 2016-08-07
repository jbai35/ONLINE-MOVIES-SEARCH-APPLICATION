/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hp
 */
public class Sentiment {
    private String text;
    private String type;
    private double score;
    private String timestamp;
    private double positive;
    private double negative;

    public Sentiment(String text, String type, double score, String timestamp, double positive, double negative) {
        this.text = text;
        this.type = type;
        this.score = score;
        this.timestamp = timestamp;
        this.positive = positive;
        this.negative = negative;
    }

    public Sentiment() {
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public double getPositive() {
        return positive;
    }

    public void setPositive(double positive) {
        this.positive = positive;
    }

    public double getNegative() {
        return negative;
    }

    public void setNegative(double negative) {
        this.negative = negative;
    }
    
    public String toString() {
        return "Text----->" + getText();
    }
}
