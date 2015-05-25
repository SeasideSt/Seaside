accessing-files
handlerCss
	^ '/* html */
body, input, textarea, select {
	line-height: 1.5;
	font-size: 14px;
	color: #2a2a2a;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
select.fix {
	width:340px;
}
input, textarea, select {
	margin-right: 0.5em;
}
input.text, textarea {
	width: 200px;
}

/* headings */
h1, h2, h3, h4, h5, h6 {
	color: #01598d;
	margin-bottom: 1ex;
	font-weight: normal;
}
h1 {
	margin-top: 4px;
}
h2,h3,h4 {
	margin:2px 0px;
}
h2 {
	margin-bottom:0.5em;
}

table {
	border: 0;
	border-collapse: collapse;
}


td, th {
	padding: 3px 1em 3px 0;
}
label {
	font-weight:bold;
	padding: 2px 4px 2px 0px;
}
th {
	text-align: left;
}

a {
	color: #008aff;
	text-decoration: none;
}

a.selected {
	font-weight:bold;
}

a.wa-action, .groupContent a  {
		background:#eee;
		padding:3px 6px 3px 6px;
		border:1px solid #888;
		white-space:nowrap;
		width:120px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border-radius: 5px;
}
.groupContent a {
	font-size:10px;padding:2px 5px 2px 5px;
}
.groupContent a.large {
	font-size:100%;
}

a.wa-action:hover, .groupContent a:hover {
	background:#fff;
}

/* special */
.smallLogo {
	background: url(smallLogo.png) no-repeat;
	padding:4px;
	margin-left:6px;
	width:100px;
	height:54px;
}

table.wa-config {
	width:100%;
	padding:0;
}
table.wa-config td {
	padding:0px;
}
.wa-config .topbar {
	background:#ccc;
	height:22px;
	padding:4px 2px 4px 3px
}
.wa-config .header {
	background:#01598d;
	color: #fff;
	padding:4px;
	font-size:120%;
}

div.help {
	padding:8px;
	white-space:pre;
}

.handler-name {
	font-family: monospace;
}
h1.selection-title  {
	background-color:#EEEEEE;
	font-size:large;
	font-weight:bold;
	margin-top:0;
	padding-top:4px;
	padding-bottom:4px;
	padding-left:4px;
	width:100%;
}


.group {
	margin-bottom:6px;
	width: 100%;
}
.groupTitle {
	height:20px;
	font-size:1.2em;
	background:#eee;
	color:#01598d;
	padding-left:3px;
}
.groupTitle .action {
	float:right;
	padding-right:4px;
	white-space:nowrap;
}

.groupContent {
	padding-left:4px;
	margin-top:6px;
	margin-bottom: 4px;
}

/* special */
h1.logo a { 
	width: 200px;
	height: 106px;
	outline: none;
	display: block;
	text-indent: -100em;
	background: url(logo.png) no-repeat;
}
h1.title a {
	color: #01598d; 
}
span.unspecified {
	color: #ff7000;
}
a.download, a.download:hover {
	background: url(save.png) no-repeat;
	background-position: 0 50%;
	padding-left: 18px;
	border:0px
}

a.help {background: url(help.png) no-repeat;
	padding-left:16px;
	border:0px}
a.up {background: url(up.png) no-repeat;
	padding-left:16px;
	border:0px}
a.down {background: url(down.png) no-repeat;
	padding-left:16px;
	border:0px}
a.plus {background: url(plus.png) no-repeat;
	padding-left:16px;
	border:0px}
a.minus {background: url(minus.png) no-repeat;
	padding-left:16px;
	border:0px}
	
/* walkback */
.walkback th {
	text-align: right;
}

.walkback ol li {
	list-style: square;
}'