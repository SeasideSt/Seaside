rendering
renderContentOn: html
	html div
		script: html jQuery new accordion;
		with: [
			self berries keysAndValuesDo: [ :name :description |
				html div: [ html anchor: name ].
				html div: [ html paragraph: description ] ] ]