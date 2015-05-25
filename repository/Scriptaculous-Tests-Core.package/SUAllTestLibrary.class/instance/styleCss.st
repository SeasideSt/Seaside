uploaded
styleCss
	^ '/* Adapted from http://script.aculo.us, thanks to Thomas Fuchs */

body { 
	margin: 0;
	font: 11px Lucida Grande, Verdana, Arial, Helvetica, sans serif;
	background: url(background.gif) repeat-x #fff;
}

a, a:hover, a:visited, a:active {
	color: #e8a400;
	cursor: pointer;
}

img {
	border: 0px;
}

#header {
	height: 110px;
	text-align: right;
	background: url(header.gif) #7e9e50;
	color: #333;
	margin-bottom:25px;
}

#logo {
	float: left;
}

#menu {
	list-style-type: none;
	position: absolute;
	right: 0px;
	top: 95px;
	margin: 0px;
	padding: 0px;
	margin-top: -10px;
	padding-right: 5px;
}

#menu li {
	text-transform: lowercase;
	float: left;
}

#menu li a {
	display: block;
	width: 110px;
	padding-top: 9px;
	height: 16px;
	text-align: center;
	text-decoration: none;
	color: #fff;
	font-weight: bold;
	background: url(menu.gif) 110px 0px;
}

#menu a.active {
	color: #7f9f50;
	background: url(menu.gif) 0px 0px;
}

#menu a:hover {
	color: #7f9f50;
	background: url(menu.gif) 0px 0px;
}

#content {
	margin-left: 60px;
	margin-right: 60px;
}

#content h1 {
	font: 22px Georgia, serif;
	color: #7e9e50;
	font-weight: normal;
	margin: 0px;
	padding: 0px;
	text-transform: lowercase;
	font-style: italic;
	padding-bottom: 4px;
	border-bottom: 1px dotted #c5dea1;
	clear: left;
}

#content h2 {
	font: 18px Georgia, serif;
	color: #7e9e50;
	font-size: 15px;
	font-weight: normal;
	margin: 0px;
	padding: 0px;
	margin-top: 20px;
	text-transform: lowercase;
	font-style: italic;
}

#content h3 {
	font: 13px Lucida Grande, Verdana, Arial, Helvetica, sans serif;
	margin: 0px;
	padding: 0px;
	margin-left: 10px;
	margin-top: 10px;
	font-weight: bold;
	text-transform: lowercase;
	color: #444444;
}

#content p, div.paragraph {
	font-size: 12px;
	line-height: 1.7;
	color: #444444;
	margin-left: 10px;
	margin-top: 10px;
}

/* demo box */
div.box {
	width: 120px;
	height: 120px;
	margin-right: 10px;
	margin-bottom: 10px;
	background: url(demo.gif);
}

div.box div.header {
	height: 23px;
	background: url(demo-logo.gif) repeat-x;
}

div.box div.content {
	padding-top: 1em;
	text-align: center;
}

div.smallBox {
	width: 100%;
	height: 100%;
	background: url(demo.gif) ;
}

div.smallBox div.header {
	height: 20px;
	background: url(demo-logo.gif) repeat-x;
}
div.smallBox div.content {
	padding-top: 1em;
	text-align: center;
}

/* source code */
div.source {
	margin: 5px;
	padding: 5px;
	border: 1px solid #dddddd;
	background: #f5f5f5;
	font: 12px Lucida Sans Typewriter, Courier, monospace;
}'