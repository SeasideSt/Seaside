rendering
renderContentOn: html
	html div class: 'tool'; with: self report.
	self message isNil 
		ifFalse: [ html preformatted: self message ]