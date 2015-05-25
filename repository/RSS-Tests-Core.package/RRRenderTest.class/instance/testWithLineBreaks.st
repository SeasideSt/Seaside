tests
testWithLineBreaks
	| actualContent expectedContent |
	actualContent := self render: [ :rss |
		rss withLineBreaks: 'das', GRPlatform current newline, 'super', GRPlatform current newline, 'geile', GRPlatform current newline, 'Blog' ].
	expectedContent := 'das&lt;br/&gt;super&lt;br/&gt;geile&lt;br/&gt;Blog'.
	self assert: actualContent = expectedContent