accessing-styles
windowCss
	^ '.window {
	margin: 1em;
	border: 1px solid #aaa;
}
.window .window-titlebar {
	color: #444;
	padding: 5px;
	overflow: hidden;
	background-color: #eee;
	border-bottom: 1px solid #aaa;
}
.window .window-titlebar .window-title {
	float: left;
	font-weight: bold;
	padding-left: 20px;
}
.window .window-titlebar .window-close {
	float: right;
}
.window .window-titlebar .window-close a {
	color: #444;
	text-decoration: none;
}
.window .window-titlebar .window-close a:hover {
	color: #111;
}
.window .window-content {
	clear: both;
	padding: 2px;
	background-color: #fff;
}'