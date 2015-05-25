hooks
style
	^ '
div#overlay {
	z-index: 9998;
	background-color: #336699;
	filter: alpha(opacity=30);
	-moz-opacity: 0.3;
	opacity: 0.3;
}
div#overlay[id] { position: fixed; }
'