rendering
renderContentOn: html
	uid := html nextId.
	html div
		id: self mainId;
		class: self cssClass;
		with: [ 
			html div: [ 
				self renderTitleOn: html.
				self renderBodyOn: html ] ]