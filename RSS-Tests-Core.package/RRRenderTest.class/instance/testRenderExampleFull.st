tests
testRenderExampleFull
	| actualContent expectedContent |
	actualContent := self
		renderFull: [ :rss |
			rss description: 'Das super geile Blog.'.
			rss renderContentEncoded: [ :html |
				html paragraph:  'Das super geile Blog.' ].
			rss generator: 'Pier 1.0.9-alpha'.
			rss language english ]
		rootBlock: [ :root |
			root stylesheet beCss; url: 'http://yourserver.com/path/rss.css' ].
	
	expectedContent := '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/css" href="http://yourserver.com/path/rss.css"?><rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"><channel><description>Das super geile Blog.</description><content:encoded>&lt;p&gt;Das super geile Blog.&lt;/p&gt;</content:encoded><generator>Pier 1.0.9-alpha</generator><language>en</language></channel></rss>'.
	self assert: actualContent = expectedContent