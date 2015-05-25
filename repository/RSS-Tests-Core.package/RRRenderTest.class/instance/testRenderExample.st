tests
testRenderExample
	| actualContent expectedContent |
	actualContent := self render: [ :rss |
		rss description: 'Das super geile Blog.'.
		rss renderContentEncoded: [ :html |
			html paragraph:  'Das super geile Blog.' ].
		rss generator: 'Pier 1.0.9-alpha'.
		rss language english ].
	expectedContent := '<description>Das super geile Blog.</description><content:encoded>&lt;p&gt;Das super geile Blog.&lt;/p&gt;</content:encoded><generator>Pier 1.0.9-alpha</generator><language>en</language>'.
	self assert: actualContent = expectedContent