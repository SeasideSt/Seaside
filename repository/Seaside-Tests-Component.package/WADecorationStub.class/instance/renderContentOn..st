rendering
renderContentOn: html
	renderBlock isNil 
		ifTrue: [ super renderContentOn: html ]
		ifFalse: [ renderBlock value: html value: [ super renderContentOn: html ] ]