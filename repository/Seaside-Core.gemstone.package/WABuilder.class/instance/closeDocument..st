private
closeDocument: aDocument
	self fullDocument 
		ifTrue: [ aDocument close ]
		ifFalse: [ 
			"hack to make it work"
			(aDocument isKindOf: WAHtmlDocument)
				ifTrue: [ aDocument scriptGenerator closeOn: aDocument ] ]