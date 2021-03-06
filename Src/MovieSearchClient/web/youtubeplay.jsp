<%-- 
    Document   : test
    Created on : 2015-8-10, 22:41:26
    Author     : hp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
	<title>Movie Hunter</title>
        
        <style>
            body{
                border:none;
                margin:0;
                padding:30px;
                background: #334346;
                font:normal 16px/20px Lekton, sans-serif;
                min-width: 1280px;
            }
            .player{
                display:inline-block;
                vertical-align:top;
                position:relative;
                width:800px;
                height:500px;
                margin-top:100px;
                left:0;
                overflow: hidden;
                border-radius: 10px;
                border: 5px solid #fff;
                box-shadow: 0 0 10px rgba(0,0,0,.5);
            }
        </style>
        
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
        
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        
<!--        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>-->
        <link rel="Stylesheet" type="text/css" href="css/addform.css" /> 
	<!--[if IE 6]>
		<link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
	<![endif]-->
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-func.js"></script>
        
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
        <script src="js/jquery.mb.YTPlayer.js"></script>
        <script>
            jQuery(function () {
                jQuery(".player").YTPlayer();
            });
        </script> 
</head>
    
    <%
        List<Movies> movies = (List<Movies>) request.getAttribute("movies");
    %>
    
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
			    <li><a href="http://localhost:8080/MovieSearchClient/flickr.html">FLICKR</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/google.html">GOOGLE</a></li>
			    <li><a class="active" href="http://localhost:8080/MovieSearchClient/youtube.html">YOUTUBE</a></li>
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
				<form action="http://localhost:8080/MovieSearchClient/SearchByYoutube" method="POST">
					<label for="search-field">SEARCH</label>					
					<input type="text" name="keywords" value="Enter search here" id="search-field" title="Enter search here" class="blink search-field"/>
					<input type="submit" value="GO!" class="search-button"/>
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
	<div id="main">
            <!-- Content -->
		<div id="content">
                    <div>
                    <%
                        String vedioURL = "l_tHTmd5pgk";
                        if (movies != null && movies.size() > 0) {
                            vedioURL = movies.get(0).getUrl();
                            System.out.println("my vedio:"+vedioURL);
                        }
                    %>
                  
                    <div id="P1" class="player" style="display:block; margin: 50px; background: rgba(0,0,0,0.5)" data-property="{videoURL:'<%=vedioURL%>',containment:'self',showControls:true,startAt:6,mute:false,autoPlay:false,loop:false,opacity:1,showYTLogo:true}"></div> 
                    </div>
                    
                <h2>SEARCH RESULT</h2>
		<p class="text-right"><a href="#">See all</a></p>             
                <hr/> 
                <br/>
                <!-- container -->									
                                <% for (int i = 0; i < movies.size(); i++) {
                                        String imgURL = movies.get(i).getPoster();
                                        vedioURL = movies.get(i).getUrl();
                                        System.out.println("change vedio:"+vedioURL);
                                %>
                                <div class="info">                                  
                                    <a href="#"><img src="<%=imgURL%>" style="float:left"/></a>
                                        <h4 style = "margin:15px"><font size="4.5"> <%= movies.get(i).getTitle()%>  </font></h4>
                                        <p style = "margin:10px"><font size="4" color="#f3b12b"><b>Year: </b></font> <font size="3" color="white"><%= movies.get(i).getDate()%></font></p>                                   
                                        <p style = "margin:10px"><font size="4" color="#f3b12b"><b>Plot: </b></font> <font size="3" color="white"><%= movies.get(i).getPlot()%></font></p>
                                        <button onclick="jQuery('.player').YTPChangeMovie({videoURL:'<%=vedioURL%>',ratio:'4/3',showYTLogo:true})" class="search-button">PLAY</button>
                                        <!--<button onclick="jQuery('.player').YTPChangeMovie({videoURL:'<%=vedioURL%>', ratio:'4/3'})" >change movie</button>-->
                                        <br/>
                                        <br/>
                                </div>   
                                        <hr/>
                                        <br/>
                                <%
                                    }
                                %>	
				<!-- end Movie -->							
				<div class="cl">&nbsp;</div>                               
		</div>
		<!-- end Content -->    
		                                   
		<!-- NEWS -->
		<div id="news">
			<div class="head">
				<h3>NEWS</h3>
				<p class="text-right"><a href="#">See all</a></p>
			</div>
			
			<div class="content">
				<p class="date">12.04.09</p>
				<h4>Disney's A Christmas Carol</h4>
				<p>&quot;Disney's A Christmas Carol,&quot; a multi-sensory thrill ride re-envisioned by Academy Award&reg;-winning filmmaker Robert Zemeckis, captures... </p>
				<a href="#">Read more</a>
			</div>
			<div class="content">
				<p class="date">11.04.09</p>
				<h4>Where the Wild Things Are</h4>
				<p>Innovative director Spike Jonze collaborates with celebrated author Maurice Sendak to bring one of the most beloved books of all time to the big screen in &quot;Where the Wild Things Are,&quot;...</p>
				<a href="#">Read more</a>
			</div>
			<div class="content">
				<p class="date">10.04.09</p>
				<h4>The Box</h4>
				<p>Norma and Arthur Lewis are a suburban couple with a young child who receive an anonymous gift bearing fatal and irrevocable consequences.</p>
				<a href="#">Read more</a>
			</div>
		</div>
		<!-- end NEWS -->
		
		<!-- Coming -->
		<div id="coming">
			<div class="head">
				<h3>COMING SOON<strong>!</strong></h3>
				<p class="text-right"><a href="#">See all</a></p>
			</div>
			<div class="content">
				<h4>The Princess and the Frog </h4>
					<a href="#"><img src="css/images/coming-soon1.jpg" alt="coming soon" /></a>
				<p>Walt Disney Animation Studios presents the musical "The Princess and the Frog," an animated comedy set in the great city of New Orleans...</p>
				<a href="#">Read more</a>
			</div>
			<div class="cl">&nbsp;</div>
			<div class="content">
				<h4>The Princess and the Frog </h4>
					<a href="#"><img src="css/images/coming-soon2.jpg" alt="coming soon" /></a>
				<p>Walt Disney Animation Studios presents the musical "The Princess and the Frog," an animated comedy set in the great city of New Orleans...</p>
				<a href="#">Read more</a>
			</div>
			
		</div>
		<!-- end Coming -->
		<div class="cl">&nbsp;</div>
	</div>
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
