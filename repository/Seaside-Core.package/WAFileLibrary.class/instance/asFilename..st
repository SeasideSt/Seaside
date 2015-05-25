private
asFilename: aSelector 
	| dotIndex extension |
	dotIndex := self lastUpperCaseIndexIn: aSelector.
	dotIndex = 0 ifTrue: [
		"convert Symbol to String"
		^ aSelector greaseString ].
	extension := (aSelector last: aSelector size - dotIndex + 1) asLowercase.
	^ (aSelector first: dotIndex - 1) , '.' , extension