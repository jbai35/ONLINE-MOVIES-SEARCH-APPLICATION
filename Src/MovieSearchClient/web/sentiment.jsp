<%@page import="entity.Sentiment"%>
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
<!--	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
	<script type="text/javascript" src="js/jquery-func.js"></script>
        
        <style>
            .wrap{margin:0 auto;width:800px;} 
        </style>
        <style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
/*body{background:#fff;color:#333;font-family:"Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;font-size:0.9em;}*/
#container{width:900px;margin:50px auto;}
#chart, #chartData{background:url(css/images/bg_white.png);border:1px solid #333;}
#chart{display:block;margin:0 0 50px 0;float:left;cursor:pointer;}
#chartData{width:200px;margin:0 40px 0 0;float:right;border-collapse:collapse;box-shadow:0 0 1em rgba(0, 0, 0, 0.5);-moz-box-shadow:0 0 1em rgba(0, 0, 0, 0.5);-webkit-box-shadow:0 0 1em rgba(0, 0, 0, 0.5);background-position:0 -100px;}
#chartData th, #chartData td{padding:0.5em;border:1px dotted #666;text-align:left;}
#chartData th{border-bottom:2px solid #333;text-transform:uppercase;}
#chartData td{cursor:pointer;}
#chartData td.highlight{background:#e8e8e8;}
#chartData tr:hover td{background:#f0f0f0;}
</style>

<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<!--[if IE]>
<script src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
<![endif]-->

<script type="text/javascript">
// Run the code when the DOM is ready
$( pieChart );

function pieChart() {

  // Config settings
  var chartSizePercent = 55;                        // The chart radius relative to the canvas width/height (in percent)
  var sliceBorderWidth = 1;                         // Width (in pixels) of the border around each slice
  var sliceBorderStyle = "#fff";                    // Colour of the border around each slice
  var sliceGradientColour = "#ddd";                 // Colour to use for one end of the chart gradient
  var maxPullOutDistance = 25;                      // How far, in pixels, to pull slices out when clicked
  var pullOutFrameStep = 4;                         // How many pixels to move a slice with each animation frame
  var pullOutFrameInterval = 40;                    // How long (in ms) between each animation frame
  var pullOutLabelPadding = 65;                     // Padding between pulled-out slice and its label  
  var pullOutLabelFont = "bold 16px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice label font
  var pullOutValueFont = "bold 12px 'Trebuchet MS', Verdana, sans-serif";  // Pull-out slice value font
  var pullOutValuePrefix = " ";                     // Pull-out slice value prefix
  var pullOutShadowColour = "rgba( 0, 0, 0, .5 )";  // Colour to use for the pull-out slice shadow
  var pullOutShadowOffsetX = 5;                     // X-offset (in pixels) of the pull-out slice shadow
  var pullOutShadowOffsetY = 5;                     // Y-offset (in pixels) of the pull-out slice shadow
  var pullOutShadowBlur = 5;                        // How much to blur the pull-out slice shadow
  var pullOutBorderWidth = 2;                       // Width (in pixels) of the pull-out slice border
  var pullOutBorderStyle = "#333";                  // Colour of the pull-out slice border
  var chartStartAngle = -.5 * Math.PI;              // Start the chart at 12 o'clock instead of 3 o'clock

  // Declare some variables for the chart
  var canvas;                       // The canvas element in the page
  var currentPullOutSlice = -1;     // The slice currently pulled out (-1 = no slice)
  var currentPullOutDistance = 0;   // How many pixels the pulled-out slice is currently pulled out in the animation
  var animationId = 0;              // Tracks the interval ID for the animation created by setInterval()
  var chartData = [];               // Chart data (labels, values, and angles)
  var chartColours = [];            // Chart colours (pulled from the HTML table)
  var totalValue = 0;               // Total of all the values in the chart
  var canvasWidth;                  // Width of the canvas, in pixels
  var canvasHeight;                 // Height of the canvas, in pixels
  var centreX;                      // X-coordinate of centre of the canvas/chart
  var centreY;                      // Y-coordinate of centre of the canvas/chart
  var chartRadius;                  // Radius of the pie chart, in pixels

  // Set things up and draw the chart
  init();


  /**
   * Set up the chart data and colours, as well as the chart and table click handlers,
   * and draw the initial pie chart
   */

  function init() {

    // Get the canvas element in the page
    canvas = document.getElementById('chart');

    // Exit if the browser isn't canvas-capable
    if ( typeof canvas.getContext === 'undefined' ) return;

    // Initialise some properties of the canvas and chart
    canvasWidth = canvas.width;
    canvasHeight = canvas.height;
    centreX = canvasWidth / 2;
    centreY = canvasHeight / 2;
    chartRadius = Math.min( canvasWidth, canvasHeight ) / 2 * ( chartSizePercent / 100 );

    // Grab the data from the table,
    // and assign click handlers to the table data cells
    
    var currentRow = -1;
    var currentCell = 0;

    $('#chartData td').each( function() {
      currentCell++;
      if ( currentCell % 2 != 0 ) {
        currentRow++;
        chartData[currentRow] = [];
        chartData[currentRow]['label'] = $(this).text();
      } else {
       var value = parseFloat($(this).text());
       totalValue += value;
       value = value.toFixed(2);
       chartData[currentRow]['value'] = value;
      }

      // Store the slice index in this cell, and attach a click handler to it
      $(this).data( 'slice', currentRow );
      $(this).click( handleTableClick );

      // Extract and store the cell colour
      if ( rgb = $(this).css('color').match( /rgb\((\d+), (\d+), (\d+)/) ) {
        chartColours[currentRow] = [ rgb[1], rgb[2], rgb[3] ];
      } else if ( hex = $(this).css('color').match(/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/) ) {
        chartColours[currentRow] = [ parseInt(hex[1],16) ,parseInt(hex[2],16), parseInt(hex[3], 16) ];
      } else {
        alert( "Error: Colour could not be determined! Please specify table colours using the format '#xxxxxx'" );
        return;
      }

    } );

    // Now compute and store the start and end angles of each slice in the chart data

    var currentPos = 0; // The current position of the slice in the pie (from 0 to 1)

    for ( var slice in chartData ) {
      chartData[slice]['startAngle'] = 2 * Math.PI * currentPos;
      chartData[slice]['endAngle'] = 2 * Math.PI * ( currentPos + ( chartData[slice]['value'] / totalValue ) );
      currentPos += chartData[slice]['value'] / totalValue;
    }

    // All ready! Now draw the pie chart, and add the click handler to it
    drawChart();
    $('#chart').click ( handleChartClick );
  }


  /**
   * Process mouse clicks in the chart area.
   *
   * If a slice was clicked, toggle it in or out.
   * If the user clicked outside the pie, push any slices back in.
   *
   * @param Event The click event
   */

  function handleChartClick ( clickEvent ) {

    // Get the mouse cursor position at the time of the click, relative to the canvas
    var mouseX = clickEvent.pageX - this.offsetLeft;
    var mouseY = clickEvent.pageY - this.offsetTop;

    // Was the click inside the pie chart?
    var xFromCentre = mouseX - centreX;
    var yFromCentre = mouseY - centreY;
    var distanceFromCentre = Math.sqrt( Math.pow( Math.abs( xFromCentre ), 2 ) + Math.pow( Math.abs( yFromCentre ), 2 ) );

    if ( distanceFromCentre <= chartRadius ) {

      // Yes, the click was inside the chart.
      // Find the slice that was clicked by comparing angles relative to the chart centre.

      var clickAngle = Math.atan2( yFromCentre, xFromCentre ) - chartStartAngle;
      if ( clickAngle < 0 ) clickAngle = 2 * Math.PI + clickAngle;
                  
      for ( var slice in chartData ) {
        if ( clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle'] ) {

          // Slice found. Pull it out or push it in, as required.
          toggleSlice ( slice );
          return;
        }
      }
    }

    // User must have clicked outside the pie. Push any pulled-out slice back in.
    pushIn();
  }


  /**
   * Process mouse clicks in the table area.
   *
   * Retrieve the slice number from the jQuery data stored in the
   * clicked table cell, then toggle the slice
   *
   * @param Event The click event
   */

  function handleTableClick ( clickEvent ) {
    var slice = $(this).data('slice');
    toggleSlice ( slice );
  }


  /**
   * Push a slice in or out.
   *
   * If it's already pulled out, push it in. Otherwise, pull it out.
   *
   * @param Number The slice index (between 0 and the number of slices - 1)
   */

  function toggleSlice ( slice ) {
    if ( slice == currentPullOutSlice ) {
      pushIn();
    } else {
      startPullOut ( slice );
    }
  }

 
  /**
   * Start pulling a slice out from the pie.
   *
   * @param Number The slice index (between 0 and the number of slices - 1)
   */

  function startPullOut ( slice ) {

    // Exit if we're already pulling out this slice
    if ( currentPullOutSlice == slice ) return;

    // Record the slice that we're pulling out, clear any previous animation, then start the animation
    currentPullOutSlice = slice;
    currentPullOutDistance = 0;
    clearInterval( animationId );
    animationId = setInterval( function() { animatePullOut( slice ); }, pullOutFrameInterval );

    // Highlight the corresponding row in the key table
    $('#chartData td').removeClass('highlight');
    var labelCell = $('#chartData td:eq(' + (slice*2) + ')');
    var valueCell = $('#chartData td:eq(' + (slice*2+1) + ')');
    labelCell.addClass('highlight');
    valueCell.addClass('highlight');
  }

 
  /**
   * Draw a frame of the pull-out animation.
   *
   * @param Number The index of the slice being pulled out
   */

  function animatePullOut ( slice ) {

    // Pull the slice out some more
    currentPullOutDistance += pullOutFrameStep;

    // If we've pulled it right out, stop animating
    if ( currentPullOutDistance >= maxPullOutDistance ) {
      clearInterval( animationId );
      return;
    }

    // Draw the frame
    drawChart();
  }

 
  /**
   * Push any pulled-out slice back in.
   *
   * Resets the animation variables and redraws the chart.
   * Also un-highlights all rows in the table.
   */

  function pushIn() {
    currentPullOutSlice = -1;
    currentPullOutDistance = 0;
    clearInterval( animationId );
    drawChart();
    $('#chartData td').removeClass('highlight');
  }
 
 
  /**
   * Draw the chart.
   *
   * Loop through each slice of the pie, and draw it.
   */

  function drawChart() {

    // Get a drawing context
    var context = canvas.getContext('2d');
        
    // Clear the canvas, ready for the new frame
    context.clearRect ( 0, 0, canvasWidth, canvasHeight );

    // Draw each slice of the chart, skipping the pull-out slice (if any)
    for ( var slice in chartData ) {
      if ( slice != currentPullOutSlice ) drawSlice( context, slice );
    }

    // If there's a pull-out slice in effect, draw it.
    // (We draw the pull-out slice last so its drop shadow doesn't get painted over.)
    if ( currentPullOutSlice != -1 ) drawSlice( context, currentPullOutSlice );
  }


  /**
   * Draw an individual slice in the chart.
   *
   * @param Context A canvas context to draw on  
   * @param Number The index of the slice to draw
   */

  function drawSlice ( context, slice ) {

    // Compute the adjusted start and end angles for the slice
    var startAngle = chartData[slice]['startAngle']  + chartStartAngle;
    var endAngle = chartData[slice]['endAngle']  + chartStartAngle;
      
    if ( slice == currentPullOutSlice ) {

      // We're pulling (or have pulled) this slice out.
      // Offset it from the pie centre, draw the text label,
      // and add a drop shadow.

      var midAngle = (startAngle + endAngle) / 2;
      var actualPullOutDistance = currentPullOutDistance * easeOut( currentPullOutDistance/maxPullOutDistance, .8 );
      startX = centreX + Math.cos(midAngle) * actualPullOutDistance;
      startY = centreY + Math.sin(midAngle) * actualPullOutDistance;
      context.fillStyle = 'rgb(' + chartColours[slice].join(',') + ')';
      context.textAlign = "center";
      context.font = pullOutLabelFont;
      context.fillText( chartData[slice]['label'], centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) );
      context.font = pullOutValueFont;
      context.fillText( pullOutValuePrefix + chartData[slice]['value'] + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +  "%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
      context.shadowOffsetX = pullOutShadowOffsetX;
      context.shadowOffsetY = pullOutShadowOffsetY;
      context.shadowBlur = pullOutShadowBlur;

    } else {

      // This slice isn't pulled out, so draw it from the pie centre
      startX = centreX;
      startY = centreY;
    }

    // Set up the gradient fill for the slice
    var sliceGradient = context.createLinearGradient( 0, 0, canvasWidth*.75, canvasHeight*.75 );
    sliceGradient.addColorStop( 0, sliceGradientColour );
    sliceGradient.addColorStop( 1, 'rgb(' + chartColours[slice].join(',') + ')' );

    // Draw the slice
    context.beginPath();
    context.moveTo( startX, startY );
    context.arc( startX, startY, chartRadius, startAngle, endAngle, false );
    context.lineTo( startX, startY );
    context.closePath();
    context.fillStyle = sliceGradient;
    context.shadowColor = ( slice == currentPullOutSlice ) ? pullOutShadowColour : "rgba( 0, 0, 0, 0 )";
    context.fill();
    context.shadowColor = "rgba( 0, 0, 0, 0 )";

    // Style the slice border appropriately
    if ( slice == currentPullOutSlice ) {
      context.lineWidth = pullOutBorderWidth;
      context.strokeStyle = pullOutBorderStyle;
    } else {
      context.lineWidth = sliceBorderWidth;
      context.strokeStyle = sliceBorderStyle;
    }

    // Draw the slice border
    context.stroke();
  }


  /**
   * Easing function.
   *
   * A bit hacky but it seems to work! (Note to self: Re-read my school maths books sometime)
   *
   * @param Number The ratio of the current distance travelled to the maximum distance
   * @param Number The power (higher numbers = more gradual easing)
   * @return Number The new ratio
   */

  function easeOut( ratio, power ) {
    return ( Math.pow ( 1 - ratio, power ) + 1 );
  }

};
</script>

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
			    <li><a href="http://localhost:8080/MovieSearchClient/flickr.html">FLICKR</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/google.html">GOOGLE</a></li>
			    <li><a href="http://localhost:8080/MovieSearchClient/youtube.html">YOUTUBE</a></li>
                            <li><a class="active" href="http://localhost:8080/MovieSearchClient/sentiment.html">SENTIMENT</a></li>
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
				<form action="http://localhost:8080/MovieSearchClient/SearchBySentiment" method="POST">
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
                    <h3>Add Movie<a href="#ty" title="????" class="close_btn" onclick="hide()" id="closeBtn">×</a></h3>                 
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

                    <%
                        Sentiment sentiment = (Sentiment)request.getAttribute("sentiment");
                    %>
                    <br/>
                    <br/>
                <h2>SEARCH RESULT</h2>
		<p class="text-right"><a href="#">See all</a></p>             
                <hr/> 
                <br/>
                
                <div class ="wrap">
                <p style = "margin:10px"><font size="4" color="#f3b12b"><b>Text: </b></font> <font size="3" color="white"><%= sentiment.getText()%></font></p>                                   
                <p style = "margin:10px"><font size="4" color="#f3b12b"><b>Type: </b></font> <font size="3" color="white"><%= sentiment.getType()%></font></p>
		<p style = "margin:10px"><font size="4" color="#f3b12b"><b>Score: </b></font> <font size="3" color="white"><%= sentiment.getScore()%></font></p>	
		
                <div id="container">	
		<canvas id="chart" width="600" height="500"></canvas>	
		<table id="chartData">
			<tr>
			     <th>Type</th><th>Amount</th>
			</tr>
			<tr style="color:red">
			     <td>Positive</td><td><%= sentiment.getPositive()%></td>
			</tr>
			<tr style="color:blue">
                             <td>Negative</td><td><%= sentiment.getNegative()%></td>
                        </tr>     
		</table>	
	        </div>
                <!--container end-->
                </div>	
                
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
