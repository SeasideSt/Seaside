Class {
	#name : #RRStylesOne,
	#superclass : #WAFileLibrary,
	#category : 'RSS-Examples'
}

{ #category : #accessing }
RRStylesOne >> selectorsToInclude [
	^ #(
		styleCss
	)
]

{ #category : #css }
RRStylesOne >> styleCss [
	^ '
rss {
	display: block;
	font-family: verdana, arial;
}
title {
	display: block;
	margin: 5px;
	padding: 2px;
	color: gray;
	border-bottom: 1px solid silver;
}
link {
	display: block;
	font-size: small;
	padding-left: 10px;
}
item {
	display: block;
	padding: 2px 30px 2px 30px;
}
docs {
	display: block;
	background-color: #ffffe6;
	margin: 20px;
	text-align: center;
	padding: 5px;
	color: #7f7f7f;
	border: 1px solid silver;
}
/* all hidden elements */
language, lastBuildDate, ttl, guid, category, description, pubDate {
	display: none;
}
'
]
