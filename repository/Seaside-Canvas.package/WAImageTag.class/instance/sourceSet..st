attributes
sourceSet: aString
	"One or more image candidate strings, each separated from the next by a $, (U+002C) character.
	http://www.w3.org/html/wg/drafts/html/master/embedded-content.html#attr-picture-source-srcset"
	self attributes at: 'srcset' put: aString