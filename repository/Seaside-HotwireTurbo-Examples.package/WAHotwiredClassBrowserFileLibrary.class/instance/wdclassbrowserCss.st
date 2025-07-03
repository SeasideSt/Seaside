stylesheet
wdclassbrowserCss

^ '
body { 
   background-color: #e0e0e0;
 }

input[type=search] { 
	background-color: #fafafa !important;
 }

.code-navigation {
	background-color: #fafafa;
	list-style: none;
	display:inline-block;
   border:1px solid;
   padding: 10px;
	height: 200px;
	width: 100%;
	overflow-y:scroll; }
	
.package-list { 
	list-style-image: url("package.png");
 }

.class-list { 
	list-style-image: url("class.png");
 }

.code-navigation li {
	margin-left: 18px;
}

.code-navigation li a {
  color: inherit;
  text-decoration: inherit;
}
	
.code-navigation li:hover { 
	background-color: #82b1ff;
	color: white }
	
.code-navigation li.option-selected { 
	background-color: #0d47a1;
}

.code-navigation li.option-selected a { 
	color: white;
}
'