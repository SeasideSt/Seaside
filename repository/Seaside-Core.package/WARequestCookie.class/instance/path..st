accessing
path: aString
 	path := self sanitizePath: aString.

 	self
 		pathUnencoded: path
 		codec: nil