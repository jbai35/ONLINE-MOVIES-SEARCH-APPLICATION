/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Movies;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author hp
 */
public class MovieListServlet extends HttpServlet {

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
        HttpURLConnection httpConnection = null;
        try {
            URL restServiceURL = new URL("http://localhost:8080/MovieRestfulWebService/webresources/entity.movies");
            httpConnection = (HttpURLConnection) restServiceURL.openConnection();
            httpConnection.setRequestMethod("GET");
            httpConnection.setRequestProperty("Accept", "application/json");
            if (httpConnection.getResponseCode() != 200) {
                throw new RuntimeException("HTTP GET Request Failed with Error code : "
                        + httpConnection.getResponseCode());
            }
            BufferedReader responseBuffer = new BufferedReader(new InputStreamReader(
                    (httpConnection.getInputStream())));
            String result = "", output;
            while ((output = responseBuffer.readLine()) != null) {
                result += output;
            }
            System.out.println(result);
            
            JSONArray array = JSONArray.fromObject(result);
            List<Movies> movies = new ArrayList<Movies>();
            for (int i = 0; i < array.size(); i++) {
                JSONObject json = array.getJSONObject(i);
                Movies m = new Movies(json.getInt("id"), json.getString("title"), json.getString("director"), json.getString("writer"), json.getString("stars"), json.getString("genres"), json.getString("plot"), json.getDouble("rating"), json.getString("date"), json.getString("poster"), json.getString("url"));
                movies.add(m);
            }
            
            request.setAttribute("movieList", movies);
            request.getRequestDispatcher("./localplay.jsp").forward(request, response);

            //System.out.print(result);
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("./error.jsp").forward(request, response);
        } finally {
            httpConnection.disconnect();
        }
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
