/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "movies")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Movies.findAll", query = "SELECT m FROM Movies m"),
    @NamedQuery(name = "Movies.findById", query = "SELECT m FROM Movies m WHERE m.id = :id"),
    @NamedQuery(name = "Movies.findByTitle", query = "SELECT m FROM Movies m WHERE m.title = :title"),
    @NamedQuery(name = "Movies.findByDirector", query = "SELECT m FROM Movies m WHERE m.director = :director"),
    @NamedQuery(name = "Movies.findByWriter", query = "SELECT m FROM Movies m WHERE m.writer = :writer"),
    @NamedQuery(name = "Movies.findByStars", query = "SELECT m FROM Movies m WHERE m.stars = :stars"),
    @NamedQuery(name = "Movies.findByGenres", query = "SELECT m FROM Movies m WHERE m.genres = :genres"),
    @NamedQuery(name = "Movies.findByPlot", query = "SELECT m FROM Movies m WHERE m.plot = :plot"),
    @NamedQuery(name = "Movies.findByRating", query = "SELECT m FROM Movies m WHERE m.rating = :rating"),
    @NamedQuery(name = "Movies.findByDate", query = "SELECT m FROM Movies m WHERE m.date = :date"),
    @NamedQuery(name = "Movies.findByPoster", query = "SELECT m FROM Movies m WHERE m.poster = :poster"),
    @NamedQuery(name = "Movies.findByUrl", query = "SELECT m FROM Movies m WHERE m.url = :url")})
public class Movies implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Size(max = 255)
    @Column(name = "title")
    private String title;
    @Size(max = 255)
    @Column(name = "director")
    private String director;
    @Size(max = 255)
    @Column(name = "writer")
    private String writer;
    @Size(max = 255)
    @Column(name = "stars")
    private String stars;
    @Size(max = 255)
    @Column(name = "genres")
    private String genres;
    @Size(max = 2048)
    @Column(name = "plot")
    private String plot;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "rating")
    private BigDecimal rating;
    @Size(max = 45)
    @Column(name = "date")
    private String date;
    @Size(max = 255)
    @Column(name = "poster")
    private String poster;
    @Size(max = 255)
    @Column(name = "url")
    private String url;

    public Movies() {
    }

    public Movies(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public String getGenres() {
        return genres;
    }

    public void setGenres(String genres) {
        this.genres = genres;
    }

    public String getPlot() {
        return plot;
    }

    public void setPlot(String plot) {
        this.plot = plot;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Movies)) {
            return false;
        }
        Movies other = (Movies) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Movies[ id=" + id + " ]";
    }
    
}
