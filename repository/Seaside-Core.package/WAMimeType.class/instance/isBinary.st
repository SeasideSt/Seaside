testing
isBinary
	"answers whether the contents of a document of the receiving mime type are binary"
	| syntax |

	self main = 'text' ifTrue: [^false].

	syntax := self syntax.

	(self main = 'application' and: [syntax = 'json'])
		ifTrue: [ "application/json and application/*+json are text" ^false].

	(#('x-javascript' 'javascript' 'xml') includes: syntax)
		ifTrue: [ "*/(x-)javascript and */xml are text" ^false].

	^true