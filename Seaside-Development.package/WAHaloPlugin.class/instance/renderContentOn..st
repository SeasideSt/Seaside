rendering
renderContentOn: html
	html div
		class: self cssClass;
		with: [ super renderContentOn: html ]