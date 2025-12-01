Extension { #name : 'WAHtmlCanvas' }

{ #category : '*Seaside-Microdown' }
WAHtmlCanvas >> microDown: aMicroDownText [

	(WAMicroDownRenderer on: self) visit: (Microdown parse: aMicroDownText)
]
