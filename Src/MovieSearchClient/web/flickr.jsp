<%-- 
    Document   : flickr
    Created on : 2015-8-11, 18:02:31
    Author     : hp
--%>

<%@page import="java.util.List"%>
<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title>Movie Hunter</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <link rel="Stylesheet" type="text/css" href="css/addform.css" />        
        <!--[if IE 6]>
                <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
        <![endif]-->
<!--        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
        <script type="text/javascript" src="js/jquery-func.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.1.js"></script>
        <script type="text/javascript" src="js/my.js"></script>
        <style type="text/css">
            *{padding: 0px;margin: 0px;list-style-type:none;}
            body{padding: 0px;margin: 0px;}
            .base{position: relative;width:1000px;border: 1px solid #e6e6e6;left:50%;height: 625px;margin-left: -500px;}
            .base_left{position: absolute;width:70px;height:595px;text-align: center;cursor: pointer;}
            .jiantou_left{position: absolute;padding:0px;top: 50%;margin-top: -40px;left:9px;width:50px;height:80px;display: block;
                          background: url("slider/slider.png") no-repeat 0 0;
                          background-position: 4px -82px;}
            .base_right{position: absolute;width:68px;height:595px;text-align: center;right:0px;cursor: pointer;}
            .jiantou_right{position: absolute;left:0px;top: 50%;margin-top: -40px;left:9px;width:50px;height:80px;display: block;
                           background: url("slider/slider.png") no-repeat 0 0;
                           background-position: 5px 5px;}
            .content{  height: 595px; width: 860px;position: absolute;border:1px solid #e6e6e6;left:70px;
                       background: url(css/images/flickr.jpg) no-repeat;background-position: 50%;background-size: contain;}
            .toggle{position: absolute;top: 596px;width: 100%;height: 30px;background: #fafafa;line-height: 30px;border-top: 1px solid #e6e6e6;}
            .toggle .list{font-size: 14px;color: #666;width: 98px;cursor: pointer;background: white;}
            .toggle .list span{display: block;position: absolute;
                               left: 66px;top: 3px;width: 19px;height: 19px;
                               background: url("slider/list.png") no-repeat 0 0;
                               background-position: -16px -58px;}
            .bottle{position: absolute;width:100%;top:625px;border:1px solid #e6e6e6;overflow: hidden;height:0px;}
            .bottle ul{margin: 0px;position: absolute;height:100px;padding:0px;display:flex;width:10000px;}
            #list_shot{height:100px;width:880px;position: absolute;left: 59px;overflow: hidden;}
            .bottle .l{display: block;position: absolute;
                       left: 13px;top: 41px;width: 19px;height: 19px;
                       background: url("slider/slider.png") no-repeat 0 0;
                       background-position: -22px -205px;cursor: pointer;}
            .bottle .r{display: block;position: absolute;
                       left: 969px;top: 41px;width: 19px;height: 19px;
                       background: url("slider/slider.png") no-repeat 0 0;
                       background-position: 6px -205px;cursor: pointer;}
            .bottle ul li{text-decoration: none;float: left;height:100px;margin: 0px 5px;
                          position: relative;left:0px;transition: left 0.5s;border:1px solid #e6e6e6;cursor: pointer;}
            .bottle ul li:hover {border:1px solid red;}
        </style>
    </head>

    <body>
        <!-- Shell -->
        <div id="shell">
            <!-- Header -->
            <div id="header">
                <h1 id="logo"><a href="#">Movie Hunter</a></h1>
                <div class="social">
                    <span>FOLLOW US ON:</span>
                    <ul>
                        <li><a class="twitter" href="#">twitter</a></li>
                        <li><a class="facebook" href="#">facebook</a></li>
                        <li><a class="vimeo" href="#">vimeo</a></li>
                    </ul>
                </div>

                <!-- Navigation -->
                <div id="navigation">
                    <ul>
                        <li><a href="http://localhost:8080/MovieSearchClient/home.html">HOME</a></li>
                        <li><a href="http://localhost:8080/MovieSearchClient/MovieList">LOCAL</a></li>
                        <li><a class="active" href="http://localhost:8080/MovieSearchClient/flickr.html">FLICKR</a></li>
                        <li><a href="http://localhost:8080/MovieSearchClient/google.html">GOOGLE</a></li>
                        <li><a href="http://localhost:8080/MovieSearchClient/youtube.html">YOUTUBE</a></li>
                        <li><a href="http://localhost:8080/MovieSearchClient/sentiment.html">SENTIMENT</a></li>
                        <li><a href="#pa" onclick="show()" id="example">ADD</a></li>
                    </ul>
                </div>
                <!-- end Navigation -->

                <!-- Sub-menu -->
                <div id="sub-navigation">
			<ul>
			    <li><a href="http://localhost:8080/MovieSearchClient/home.html">SHOW ALL</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/laters.html">LATEST TRAILERS</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/rated.html">TOP RATED</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/commented.html">MOST COMMENTED</a></li>
			</ul>
                    <div id="search">
                        <form action="http://localhost:8080/MovieSearchClient/SearchByFlickr" method="POST">
                            <label for="search-field">SEARCH</label>					
                            <input type="text" name="keywords" value="Enter search here" id="search-field" title="Enter search here" class="blink search-field"  />
                            <input type="submit" value="GO!" class="search-button" />
                        </form>
                    </div>
                </div>
                <!-- end Sub-Menu -->	
            </div>
            <!-- end Header -->
            
            <div id="LoginBox" class="container" style="display:none">  
                <form id="contact" action="http://localhost:8080/MovieSearchClient/AddMovieServlet" method="post">
                    <h3>Add Movie<a href="#ty" title="关闭窗口" class="close_btn" onclick="hide()" id="closeBtn">×</a></h3>                 
                    <h4>Please fill all the texts in the fields.!</h4>
<!--                    <fieldset>
                        <input name="ID" placeholder="Movie ID" type="text" tabindex="1" required autofocus>
                    </fieldset>-->
                    <fieldset>
                        <input name="title" placeholder="Movie Title" type="text" tabindex="2" required>
                    </fieldset>
                    <fieldset>
                        <input name="director" placeholder="Director" type="text" tabindex="3" required>
                    </fieldset>
                    <fieldset>
                        <input name="writer" placeholder="Writer" type="text" tabindex="4" required>
                    </fieldset>
                    <fieldset>
                        <input name="stars" placeholder="Stars" type="text" tabindex="5" required>
                    </fieldset>
                    <fieldset>
                        <input name="genres" placeholder="Genres" type="text" tabindex="6" required>
                    </fieldset>                                
                    <fieldset>
                        <textarea name="plot" placeholder="Plot" tabindex="7" required></textarea>
                    </fieldset>
                    <fieldset>
                        <input name="rating" placeholder="Rating" type="number" min="0" max="10" step="0.1" tabindex="8" required>
                    </fieldset>   
                    <fieldset>
                        <input name="date" placeholder="Date" type="text" tabindex="9" required>
                    </fieldset>   
                    <fieldset>
                        <input name="poster" placeholder="Poster Url - http://" type="url" tabindex="10" required>
                    </fieldset>   
                    <fieldset>
                        <input name="video" placeholder="Video Url - http://" type="url" tabindex="6" required>
                    </fieldset>                                   
                    <fieldset>
                        <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
                    </fieldset>
                </form>
        </div>

            <script type="text/javascript">
                function show() {
                    var target = document.getElementById("LoginBox");
                    target.style.display = "block";
                }

                function hide() {
                    var target = document.getElementById("LoginBox");
                    target.style.display = "none";
                }
            </script>

            <!-- Main -->


            <br/>
            <h2>SEARCH RESULT</h2>
            <p class="text-right"><a href="#">See all</a></p>             
            <hr/> 
            <br/>
            <%
                List<URL> urls = (List<URL>) request.getAttribute("urls");
            %>

            <div class="base">

                <div class="base_two">
                    <div class="base_left"><span class="jiantou_left"></span></div>
                    <div class="content"></div>
                    <div class="base_right"><span class="jiantou_right"></span></div>
                </div>

                <div class="toggle"><div class="list">|图片列表<span></span>&nbsp;&nbsp;</div></div>

                <div class="bottle">
                    <span class="l"></span>
                    <div id="list_shot">
                        <ul>
                            <% for (int i = 0; i < urls.size(); i++) {
                                    URL url = urls.get(i);
                                    System.out.println(url);
                            %>
                            <li><img src="<%=url%>"  width="115px" height="100px"></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                    <span class="r"></span>
                </div>
            </div>

            <div class="cl">&nbsp;</div>

            <!-- end Main -->

	<!-- Footer -->
	<div id="footer">
		<p>
			<a href="http://localhost:8080/MovieSearchClient/home.html">HOME</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/MovieList">LOCAL</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/flickr.html">FLICKR</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/google.html">GOOGLE</a> <span>|</span>
                        <a href="http://localhost:8080/MovieSearchClient/youtube.html">YOUTUBE</a> <span>|</span>
                        <a href="http://localhost:8080/MovieSearchClient/sentiment.html">SENTIMENT</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/laters.html">LATERS TRAILERS</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/rated.html">TOP RATED TRAILERS</a> <span>|</span>
			<a href="http://localhost:8080/MovieSearchClient/commented.html">MOST COMMENTED TRAILERS</a> <span>|</span>			
			<a href="#pa" onclick="show()" id="example">ADD</a>
		</p>
		<p> &copy; 2015 Movie Hunter. All Rights Reserved.  Designed by <a href="785554157@qq.com" target="_blank" title="Movie Hunter">785554157@qq.com</a></p>
	</div>
	<!-- end Footer -->
        </div>
        <!-- end Shell -->
    </body>
</html>
