private
assert: aString next: anInteger startingAt: startIndex encoder: aClass gives: anEncodedString
	| actual |
	actual := String streamContents: [ :stream |
		(aClass on: stream codec: self requestContext codec)
			greaseNext: anInteger putAll: aString startingAt: startIndex ].
	self assert: actual = anEncodedString