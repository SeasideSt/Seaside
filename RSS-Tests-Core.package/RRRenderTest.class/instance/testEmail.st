tests
testEmail
	| actual expected |
	actual := self render: [ :rss |
		rss author: (WAEmailAddress address: 'joesmith@example.com' username: 'Joe Smith') ].
	expected := '<author>Joe Smith &lt;joesmith@example.com&gt;</author>'.
	self assert: actual = expected