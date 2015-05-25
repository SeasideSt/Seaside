tests-encoding
testCanvasWithLineBreaksAndUrls
	self
		assert: [ :html | html withLineBreaksAndUrls: '1. This is http://www.seaside.st online.
2. This is http://www.squeak.org online.' ]
		gives: '1. This is <a href="http://www.seaside.st">http://www.seaside.st</a> online.<br/>2. This is <a href="http://www.squeak.org">http://www.squeak.org</a> online.'