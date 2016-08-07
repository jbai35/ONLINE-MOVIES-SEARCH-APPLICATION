/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Sentiment;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
public class SearchBySentiment extends HttpServlet {



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
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String k = request.getParameter("keywords");
        String keywords = replaceAllBlank(k);
        System.out.println(keywords);
        String url = "https://api.dandelion.eu/datatxt/sent/v1/?lang=en&text=" + keywords + "&$app_id=2ce0b3f1&$app_key=7a1187e91090542245e2e828bcefcf55";
        System.out.println(url);
        String jsonString = "[" + getStringFromURL(url) + "]";
        System.out.println(jsonString);
        try {
            JSONArray jsonArray = new JSONArray(jsonString);
           
                JSONObject jobj = (JSONObject) jsonArray.get(0);
                JSONObject subjobj1 = jobj.getJSONObject("sentiment");
                String type = subjobj1.getString("type");
                double score = Double.valueOf(subjobj1.getString("score"));
                String timestamp = jobj.getString("timestamp");
                double positive = (1 + score)/2;
                double negative = (1 - score)/2;
                Sentiment sentiment = new Sentiment();
                sentiment.setText(k);
                sentiment.setType(type);
                sentiment.setScore(score);
                sentiment.setTimestamp(timestamp);
                sentiment.setPositive(positive);
                sentiment.setNegative(negative);
                
                request.setAttribute("sentiment", sentiment);
                request.getRequestDispatcher("./sentiment.jsp").forward(request, response);
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
            System.out.println(httpConnection.getResponseCode());
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
