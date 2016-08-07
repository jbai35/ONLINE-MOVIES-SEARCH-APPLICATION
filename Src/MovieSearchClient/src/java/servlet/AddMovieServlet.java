/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Movies;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.AddMovie;

/**
 *
 * @author hp
 */
public class AddMovieServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//          int id = Integer.valueOf(request.getParameter("ID"));
          String title = request.getParameter("title");
          String director = request.getParameter("director");
          String writer = request.getParameter("writer");
          String stars = request.getParameter("stars");
          String genres = request.getParameter("genres");
          String plot = request.getParameter("plot");
          double rating = Double.valueOf(request.getParameter("rating"));
          String date = request.getParameter("date");
          String poster = request.getParameter("poster");
          String url = request.getParameter("video");
          Movies m = new Movies();
//          m.setId(id);
          m.setTitle(title);
          m.setDirector(director);
          m.setWriter(writer);
          m.setStars(stars);
          m.setGenres(genres);
          m.setPlot(plot);
          m.setRating(rating);
          m.setDate(date);
          m.setPoster(poster);
          m.setUrl(url);
          AddMovie add = new AddMovie();
          add.create_JSON(m);
          
          List<Movies> movies = new ArrayList<Movies>();
          movies.add(m);
          request.setAttribute("movieList", movies);
          request.getRequestDispatcher("./localplay.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
