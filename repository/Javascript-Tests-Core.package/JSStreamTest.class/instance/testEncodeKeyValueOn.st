tests-encoding
testEncodeKeyValueOn
	| actual |
	actual := String streamContents: [ :stream |
		JSStream encodeKey: 'key' value: 'value' on: stream ].
	self assert: actual = '"key":"value"'