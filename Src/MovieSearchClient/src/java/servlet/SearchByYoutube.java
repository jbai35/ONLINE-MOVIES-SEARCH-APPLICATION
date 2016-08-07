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
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author hp
 */
public class SearchByYoutube extends HttpServlet {

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

//        String keyword = URLEncoder.encode(k,"utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String k = request.getParameter("keywords");
        System.out.println(k);
        String keywords = replaceAllBlank(k);
        String url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDExqVOzsfLcE6D87mOAybLVWI1HAUP5zk&part=snippet&maxResults=10&q=" + keywords;
        System.out.println(url);
        String jsonString = getStringFromURL(url);
        System.out.println(jsonString);
        List<Movies> movies = new ArrayList<Movies>();
        try {
            JSONObject jsonObject = new JSONObject(jsonString);
            JSONArray jsonArray = new JSONArray(jsonObject.getString("items"));
            for (int i = 0; i < jsonArray.length(); ++i) {
                JSONObject jobj = (JSONObject) jsonArray.get(i);
                Movies m = new Movies();
                JSONObject subjobj1 = jobj.getJSONObject("id");
                String vedioURL = "https://www.youtube.com/watch?v=" + subjobj1.getString("videoId");
                m.setUrl(vedioURL);
                JSONObject subjobj2 = jobj.getJSONObject("snippet");
                m.setTitle(subjobj2.getString("title"));
                m.setDate(subjobj2.getString("publishedAt"));
                m.setPlot(subjobj2.getString("description"));

                JSONObject subSubJo = subjobj2.getJSONObject("thumbnails").getJSONObject("medium");
                m.setPoster(subSubJo.getString("url"));

                System.out.println("title:" + subjobj2.getString("title"));
                movies.add(m);
            }
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("./youtubeplay.jsp").forward(request, response);
        } catch (JSONException ex) {
            ex.printStackTrace();
            request.getRequestDispatcher("./error.jsp").forward(request, response);
        }

    }

    public String getStringFromURL(String url) {

        HttpURLConnection httpConnection = null;
        try {
            URL restServiceURL = new URL(url);
            httpConnection = (HttpURLConnection) restServiceURL.openConnection();
            httpConnection.setDoOutput(true);
            httpConnection.setRequestMethod("GET");

//            httpConnection.setRequestProperty("Content-type", "text/html; charset=utf-8");
//            httpConnection.setRequestProperty("Accept-Charset", "utf-8");
//            httpConnection.setRequestProperty("contentType", "utf-8");
            if (httpConnection.getResponseCode() != 200) {
                throw new RuntimeException("HTTP GET Request Failed with Error code : "
                        + httpConnection.getResponseCode());
            }
            BufferedReader responseBuffer = new BufferedReader(new InputStreamReader(
                    (httpConnection.getInputStream())));
            System.out.println("httpConnection.getContentEncoding: " + httpConnection.getContentEncoding());
            String result = "", output;
            while ((output = responseBuffer.readLine()) != null) {
                result += output;
            }
            return result;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            httpConnection.disconnect();
        }
        return "";

    }
    
    // 计算字符串中包含的空格个数
	public static int getBlankNum(String testString) {
		int count = 0;
		for (int i = 0; i < testString.length(); i++) {
			String tempString = String.valueOf(testString.charAt(i));
			if (tempString.equals(" ")) {
				count++;
			}
		}
		return count;
	}
        
        // 打印char[]数组
	public static void printArray(char[] testArray) {
		for (char i : testArray) {
			System.out.print(i);
		}
		System.out.println();
	}
        
    	// 将字符串空格转换为20%
	public static String replaceAllBlank(String testString) {

		if (testString == null || testString.length() <= 0) {
			return null;
		}
		// 字符数组初始长度
		int length = testString.length();
		// 字符数组增加长度后
		int newLength = newLength = getBlankNum(testString) * 2
				+ testString.length();
		char[] tempArray = new char[newLength];
		System.arraycopy(testString.toCharArray(), 0, tempArray, 0, testString
				.toCharArray().length);
		int indexofOriginal = length - 1;
		int indexofNew = newLength - 1;
		System.out.println("未替换空格时的字符串：");
		printArray(tempArray);
		while (indexofOriginal >= 0 && indexofOriginal != indexofNew) {
			if (tempArray[indexofOriginal] == ' ') {
				tempArray[indexofNew--] = '0';
				tempArray[indexofNew--] = '2';
				tempArray[indexofNew--] = '%';
			} else {
				tempArray[indexofNew--] = tempArray[indexofOriginal];
			}
			indexofOriginal--;
		}
		System.out.println("替换空格后的字符串：");
		printArray(tempArray);
                String result = String.copyValueOf(tempArray);
                System.out.println(result);
                return result;
                
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
