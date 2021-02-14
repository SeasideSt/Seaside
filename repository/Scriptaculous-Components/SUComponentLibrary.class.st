Class {
	#name : #SUComponentLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Scriptaculous-Components-Libraries'
}

{ #category : #styles }
SUComponentLibrary >> accordionCss [
	^ '.accordion dt,
.accordion dd {
	margin: 0;
	padding: 0;
	overflow: auto;
}
.accordion dt {
	padding: 0.25em;
	background-color: #c5dea1;
}
.accordion dt.active {
	background-color: #e8a400;
}
.accordion dt a:link,
.accordion dt a:visited {
	color: #444;
	outline: none;
	display: block;
	padding: 0.25em;
	text-decoration: none;
}
.accordion dt.active a:link,
.accordion dt.active a:visited {
	color: #000;
}
.accordion dd {
	background-color: #fff;
}'
]

{ #category : #uploaded }
SUComponentLibrary >> arrowdownGif [
	^ #(71 73 70 56 57 97 16 0 16 0 196 17 0 129 129 129 176 176 176 212 212 212 234 234 234 251 251 251 157 157 157 193 193 193 229 229 229 133 133 133 142 142 142 243 243 243 232 232 232 233 233 233 149 149 149 147 147 147 203 203 203 128 128 128 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 249 4 1 0 0 17 0 44 0 0 0 0 16 0 16 0 0 5 58 96 36 142 100 105 158 104 106 50 79 235 182 139 233 64 116 77 55 166 97 219 134 73 36 59 72 130 112 18 4 5 169 130 173 160 58 0 158 128 131 42 18 160 5 166 17 5 2 161 192 70 6 3 175 120 236 13 1 0 59) asByteArray
]

{ #category : #uploaded }
SUComponentLibrary >> arrowrightGif [
	^ #(71 73 70 56 57 97 16 0 16 0 196 17 0 129 129 129 176 176 176 212 212 212 234 234 234 251 251 251 157 157 157 193 193 193 229 229 229 133 133 133 142 142 142 243 243 243 232 232 232 233 233 233 149 149 149 147 147 147 203 203 203 128 128 128 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 249 4 1 0 0 17 0 44 0 0 0 0 16 0 16 0 0 5 54 96 36 142 100 105 158 104 106 46 141 65 168 226 3 65 137 0 203 51 84 28 41 158 3 1 197 201 55 3 64 16 3 19 17 98 68 42 115 197 224 16 186 235 205 106 48 134 195 5 235 122 191 167 16 0 59) asByteArray
]

{ #category : #styles }
SUComponentLibrary >> carouselComponentCss [
	^ '.carouselComponent {position:relative;border:1px solid #ccc;overflow:hidden}
 .carouselComponent .carousel-list-h {width:10000px;
		position:relative;
		z-index:1}
 .carouselComponent .carousel-list-v {height:10000px;
		position:relative;
		z-index:1}
 .carouselComponent .carousel-element {
		list-style:none;
		overflow:hidden	}
.carousel-float-h {float:left}
.carousel-float-v {clear:left;float:left}
.carouselComponent .buttonh {position:relative;height:100%;float:left;background:#c5dea1;vertical-align:middle;cursor:pointer}
.carouselComponent .buttonv {clear:left;position:relative;text-align:center;background:#c5dea1;cursor:pointer}
  .carouselComponent .clip-region { border:1px dotted #ccc;
		overflow:hidden;
		margin:0px auto;
		position:relative; 
	}'
]

{ #category : #styles }
SUComponentLibrary >> carouselCss [
	^ '.carousel .nav {position:relative;padding:5px;border:1px solid #ccc;width:140px;height:100%}
	.carousel .inner {position:relative;margin:2px;overflow:hidden}
	.carousel .move {background:white;position:relative;top:0;left:0}
	.carousel .body {border:1px solid #ccc}
	.carousel .action {border:1px solid #ccc;background:#ffffe0;padding:2px}
	.carousel .nav a {text-decoration:none;color:black}
	.carousel td.right {text-align:right}
	.carousel .nav .active {background:#99ccff;border:1px dotted #ccc}' 
]

{ #category : #styles }
SUComponentLibrary >> datePickerCss [
	^ '.calendar {font-family:Arial;font-size:10px;width:150px;z-index:999}
	.calendar .day {text-align:center;border:1px solid #ccc}
	.calendar .main {border:1px solid black;background:#fff}
	.calendar .daySelected {background:#e0e0e0;font-weight:bold}
	.calendar a {text-decoration:none;color:black;}
	.calendar .day a {color:#336699;display:block;width:16px}
	.calendar .day a:hover {background:#aaa;color:white}
	.calendar .monthTable {width:100%}
	.calendar .monthRow {background:#e0e0e0}
	.calendar .calendarTitle {background-color:#f0f0f0}
	.calendar .monthCurrent {font-size:12px;font-family:verdana;width:100%}
	.calendar .yearTable {width:100%;border-top:1px solid #ccc}
	.calendar .year {font-size:10px;font-family:verdana;text-align:center}
	.calendar .year a:hover {background:#aaa;color:white}
	.calendar .yearCurrent {background:#e0e0e0;font-weight:bold}
	.calendar .day a.today {text-decoration:underline;font-weight:bold}
	.calendar .weekDay {text-align:center}
	.calendar .time {border:1px solid #ccc}
	.calendar .time input.text {width:18px}
	.calendar .time a.button {border:1px solid #aaa;background:#ccc;padding:2px;-moz-border-radius:5px;border-radius:5px}
	.calendar .time a.button:hover {background:#69c}' 
]

{ #category : #accessing }
SUComponentLibrary >> selectorsToInclude [
	^ #( treeReportCss tabPanelCss accordionCss titlePaneCss carouselCss carouselComponentCss datePickerCss windowCss splitterCss)
]

{ #category : #styles }
SUComponentLibrary >> splitterCss [
	^ '.splitter-horizontal .handle {
	height: 5px;
	position: relative;
	background-color: #c5dea1;
	cursor: row-resize;
}

.splitter-vertical div {
	float: left;
}
.splitter-vertical div.handle {
	float: left;
	width: 5px;
	height: 200px;
	position: relative;
	cursor: col-resize;
	background-color: #c5dea1;

}'
]

{ #category : #styles }
SUComponentLibrary >> tabPanelCss [
	"Based on: http://www.kalsey.com/tools/csstabs/"

	^ '.tabPanel ul.head {
	margin: 0;
	padding-left: 1em;
	padding-bottom: 19px;
	border-bottom: 1px solid #ccc;
}
.tabPanel ul.head li	{
	margin: 0;
	padding: 0;
	display: inline;
	list-style-type: none;
}
.tabPanel ul.head a:link, 
.tabPanel ul.head a:visited {
	float: left;
	color: #444;
	outline: none;
	line-height: 14px;
	margin-right: 1em;
	background: #eee;
	text-decoration: none;
	border: 1px solid #ccc;
	padding: 2px 1em 2px 1em;
}
.tabPanel ul.head a:link.active, 
.tabPanel ul.head a:visited.active {
	color: #000;
	background: #fff;
	border-bottom: 1px solid #fff;
}
.tabPanel ul.head a:hover {
	background-color: #fff;
}'
]

{ #category : #styles }
SUComponentLibrary >> titlePaneCss [
	^ '.titlePane .title {background:#e0e0e0;border-bottom-color:black;border-bottom-style:dotted;border-bottom-width:1px}
	.titlePane {border:4px solid #ccc;width:450px;overflow:hidden}
	.titlePane .body {background:white;height:100%;width:100%;overflow:hidden}
	.titlePane .closed {height:0px;display:none}
	.titlePane a.title {cursor:pointer;
					outline: none;
					padding: 0.25em;
					display: block;
					text-decoration:none;
					color:black}
	.titlePane td.label {width:100%;white-space:nowrap}
	.titlePane .gfx {background-position: center center;
					width:16px;height:10px;
					background-image: url(arrowright.gif)}
	.titlePane .gfxopen {background-position: center center;
					width:16px;height:10px;
					background-image: url(arrowdown.gif)}
	'
]

{ #category : #styles }
SUComponentLibrary >> treeReportCss [
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
]

{ #category : #styles }
SUComponentLibrary >> windowCss [
	^ 'div.suWindow {background:#e0e0e0;border:1px solid #888;overflow:hidden;position:fixed;-moz-border-radius:5px;border-radius:5px}
	.suWindow .container {overflow:auto;padding:2px}
	.suWindow .title {cursor:move;background:#888;color:white;height:16px; padding:2px 2px 3px 3px}
	.suWindow .title a {text-decoration:none;padding:2px;}' 
]
