rendering
renderContentOn: html
	html div
		class: self cssClass;
		id: (uid := html nextId);
		with: [ self renderListOn: html ]