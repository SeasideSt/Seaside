testing
isJson
	"Answers whether the receiving mime type is JSON."
	
	self main = 'application' ifFalse: [^false].
	
	^self syntax = 'json'