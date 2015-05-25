rendering
renderElement: element index: index on: html 
	| currentId |
	currentId := self 
		uid: 'head'
		at: index.
	html div
		id: currentId;
		class: 'carousel-element';
		class: self cssFloat;
		style: 'margin:' , elementMargin greaseString , 'px;height:' , self elementHeight greaseString , 'px;width:' , self elementWidth greaseString , 'px;';
		with: element