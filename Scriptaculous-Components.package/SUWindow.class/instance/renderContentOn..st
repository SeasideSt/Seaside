rendering
renderContentOn: html 
	self close.
	collapsed := false.
	html div
		id: self windowId;
		script: (html scriptaculous draggable
				handle: self titleId;
				revert: false);
		class: self cssClass;
		style: 'display: none';
		style: 'z-index:' , self zIndex greaseString , ';' , self cssOrigin , self cssExtent;
		with: [ self renderBodyOn: html ]