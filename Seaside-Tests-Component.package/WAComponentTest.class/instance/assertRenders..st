private
assertRenders: aString
	| guide |
	guide := self renderingGuide start: root.
	self assert: guide client renderContext document stream contents = aString