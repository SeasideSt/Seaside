resources
welcomeCss
	^ '* {
	line-height: 1.5;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
html, body {
	color: #2a2a2a;
	font-size: 14px;
	margin-top: 0px;
	background: #fff url("background.jpg") repeat-y center top;
}
input.text {
	color: #2a2a2a;
	font-size: 100%;
	border: 1px solid #ccc;
}

div.clear {
	clear: both;
}

a {
	color: #008AFF;
	text-decoration: none;
}

a.goback {
	font-size: 80%;
	color: #888888;
}

.container  {
	/* auto  margin positioning:*/
	/*margin-left: auto;
	margin-right:auto; */
	/* end auto margin positioning */
	
	/* negative margin positioning */
	position: absolute;
	left: 50%;
	margin-left: -450px;
	/* end negative margin positioning */
	
	margin-top: 0px;
	padding-bottom: 25px; /*with absolute positioning, the body margin for the toolbar does not seem to work*/
	width: 900px;
	/*border-right: 1px solid #cccccc;
	border-left: 1px solid #cccccc;*/
}

.sidebar  {
	width:200px;
	/*background-color: #E5F2FC;*/
	float: right;
	padding:25px;
	padding-top: 5px;
	/*border-left: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;*/
}

.sidebar li {
	list-style-type: none;
}	
	
.sidebar  h3 {
	border-bottom: 1px solid #cccccc;
	font-size: 150%;
	margin-top: 25px;
	padding-bottom: 10px;
}

.sidebar ul {
	margin-left: 0;
	padding-left: 0;
}

.sidebar li {
	margin-bottom: 5px;
}

.content  {
	margin-right: 260px;
	padding: 20px;
}

.header {
	background: #fff url("seasidestar.png") no-repeat left center;
}

.welcome {
	font-size: 225%;
	margin: 0;
}

.welcome, .congrats, .getting-started {
	padding-left: 75px;
	padding-right: 30px;
}

.congrats {
	color: #888888;
	font-size: 125%;
	font-weight: normal;
	margin: 0;
}

.getting-started, .back-form {
	border-top: 1px solid #cccccc;
	margin-top: 25px;
	padding-top: 15px;
}

.getting-started h1 {
	font-size: 150%;
	margin: 0;
}

.getting-started h2 {
	color: #333333;
	font-size: 125%;
	font-weight: normal;
	margin: 0 0 25px;
}

.getting-started ol {
	margin-left: 0;
	padding-left: 0;
	color: #888888;
	font-size: 125%;
}

.getting-started li {
	margin-bottom: 25px;
}

.getting-started li h3 {
	margin: 0;
	color: #333333;
	font-size: inherit;
	font-weight: normal;
}

.getting-started li p, .getting-started li form, .getting-started li ul li {
	font-size: 80%;
	color: #555555;
}

.getting-started li ul {
	padding-left:5pt
}

.getting-started li ul li {
	margin-bottom:0
}

.example {
	width: 630px;
	padding: 10px;
	background: #F9F9F9;
	border: 1px solid #93BDD5;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}

.seasideExample {
	background-color: #FBFFFA;
	border: 1px solid #93BDD5;
	margin: 1em;
	padding: 1em;
}

pre.codeSample {
	margin: 2em;
}

form.config input.checkbox { margin-right: 1em; }
form.config label { vertical-align: top; }
.container .buttons { text-align: center; margin-top: 2em; }
.container .buttons a { margin: 0 1em; }

/* jQuery override */
.ui-widget-overlay {
background:black;
opacity:0.6;
}

'