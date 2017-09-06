private
assert: aBlock gives: aString
	| xml |
	xml := WAXmlCanvas builder
		render: aBlock.
	self assert: aString = xml