private
assert: aBlock gives: aString
	| json |
	json := String streamContents: [ :stream |
		| context document canvas |
		document := WAJsonDocument on: stream.
		context := WARenderContext new
			actionUrl: WAUrl new;
			document: document;
			yourself.
		 canvas := WAJsonCanvas context: context.
		canvas render: aBlock.
		document close ].
	self
		assert: json = aString
		description:	'Expected: ' , aString printString , ', Actual: ', json printString
		resumable: true