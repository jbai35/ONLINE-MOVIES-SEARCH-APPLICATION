/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Dream
 */
public class Movies {

    private int id;
    private String title;
    private String director;
    private String writer;
    private String stars;
    private String genres;
    private String plot;
    private double rating;
    private String date;
    private String poster;
    private String url;

    public Movies(int id, String title, String director, String writer, String stars, String genres, String plot, double rating, String date, String poster, String url) {
        this.id = id;
        this.title = title;
        this.director = director;
        this.writer = writer;
        this.stars = stars;
        this.genres = genres;
        this.plot = plot;
        this.rating = rating;
        this.date = date;
        this.poster = poster;
        this.url = url;
    }
    
    public Movies() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public void setPlot(String plot) {
        this.plot = plot;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDirector() {
        return director;
    }

    public String getWriter() {
        return writer;
    }

    public String getStars() {
        return stars;
    }

    public String getGenres() {
        return genres;
    }

    public String getPlot() {
        return plot;
    }

    public double getRating() {
        return rating;
    }

    public String getDate() {
        return date;
    }

    public String getPoster() {
        return poster;
    }

    public String getUrl() {
        return url;
    }

    @Override
    public String toString() {
        return "Movie----->" + getId();
    }

}
