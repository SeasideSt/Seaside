styles
developmentCss
	^ '/* toolbar */
body { margin-bottom: 25px !important; /*matches toolbar min-height + padding and margin*/}
.wa-toolbar {
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 20;
	padding: 2px;
	position: fixed;
	text-align: left;
	background-color: #eee;
	border-top: 1px solid #aaa;
	min-height: 20px;
}
.wa-toolbar { vertical-align: middle; }
.wa-toolbar, .wa-toolbar * {
	color: #444;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
.wa-toolbar a {
	padding-left: 3px;
	padding-right: 3px;
	text-decoration: none;
}
.wa-toolbar a:hover {
	text-decoration: underline;
}
.wa-toolbar .wa-deprecationtoolplugin {
	color: #ff7000;
}

/* halos */
.wa-halo {
	margin: 4px;
	text-align: left;
	border: 1px solid #aaa;
}

.wa-halo .wa-halo-header {
	padding: 2px 4px ;
	overflow: hidden;
	background-color: #eee;
	border-bottom: 1px solid #aaa;
}
.wa-halo .wa-halo-header,
.wa-halo .wa-halo-header * {
	color: #444;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
.wa-halo .wa-halo-header a {
	text-decoration: none;
}
.wa-halo .wa-halo-header .wa-classnamehaloplugin,
.wa-halo .wa-halo-header .wa-browserhaloplugin,
.wa-halo .wa-halo-header .wa-inspectorhaloplugin,
.wa-halo .wa-halo-header .wa-styleshaloplugin {
	float: left;
	display: block;
	padding-right: 4px;
}
.wa-halo .wa-halo-header .wa-classnamehaloplugin {
	font-weight: bold;
	padding-right: 8px;
}
.wa-halo .wa-halo-header .wa-browserhaloplugin, .window .window-titlebar .wa-browserhaloplugin {
	background: url(codebrowser.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-inspectorhaloplugin, .window .window-titlebar .wa-inspectorhaloplugin {
	background: url(inspector.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-styleshaloplugin, .window .window-titlebar .wa-styleshaloplugin {
	background: url(styleeditor.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-browserhaloplugin a,
.wa-halo .wa-halo-header .wa-inspectorhaloplugin a,
.wa-halo .wa-halo-header .wa-styleshaloplugin a {
	width: 16px;
	outline: none;
	display: block;
	text-indent: -32000px;
	background-position: 0 50%;
}
.wa-halo .wa-halo-header .wa-modehaloplugin {
	float: right;
	display: block;
	padding-right: 4px;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a {
	text-decoration: none;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a:hover {
	text-decoration: underline;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a.active {
	font-weight: bold;
}

.wa-halo .wa-halo-body {
	clear: both;
}
.wa-halo .wa-halo-body .wa-halo-source {
	padding: 2px 4px;
	background-color: #fff;
}
.wa-halo .wa-halo-body .wa-halo-source,
.wa-halo .wa-halo-body .wa-halo-source * {
	color: #444;
	line-height: 1;
	font-size: 12px;
	font-family: Monaco, "Courier New", Courier, serif;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-tag {
	color: navy;
	font-weight: bold;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-key {
	color: navy;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value,
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value a {
	color: purple;
	text-decoration: none;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value a:hover {
	text-decoration: underline;
}'