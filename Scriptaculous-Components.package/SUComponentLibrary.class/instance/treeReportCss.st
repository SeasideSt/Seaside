styles
treeReportCss
	^ '.treeReport {
	border: solid 1px #ccc;
	border-collapse: collapse;
	background-color: white;
}
.treeReport th {
	padding: 4px;
	text-align: left;
	background-color: #ccc;
}
.treeReport td {
	text-align: left;
	vertical-align: top;
	padding-right: 5px;
}
.treeReport td .indent {
	height: 16px;
	overflow: hidden;
	white-space: nowrap;
}
.treeReport td .indent .block,
.treeReport td .indent .text {
	float: left;
	height: 16px;
}
.treeReport td .indent .block {
	width: 16px;
}
.treeReport td .indent .block a {
	width: 16px;
	height: 16px;
	outline: none;
	display: block;
	background-position: center center;
	background-image: url(arrowright.gif);
}
.treeReport td .indent .block a.expanded {
	background-image: url(arrowdown.gif);
}'