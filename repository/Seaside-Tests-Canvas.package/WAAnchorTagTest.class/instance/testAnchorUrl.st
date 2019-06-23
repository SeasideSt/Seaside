tests-tags-anchors
testAnchorUrl
	| url string |
	url := WAUrl new.
	url
		host: 'www.seaside.st';
		addToPath: 'foo bar&zork<blah';
		addField: '1' value: nil;
		addField: '2' value: 123;
		addField: '3' value: 'foo bar&zork'.
	string := 'http://www.seaside.st/foo%20bar%26zork%3Cblah?1&amp;2=123&amp;3=foo%20bar%26zork'.
	self
		assert: [ :html | html anchor url: url; with: url ]
		gives: '<a href="' , string , '">' , string , '</a>'