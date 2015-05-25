private
assertUserAgent: aString isInternetExplorer: aBoolean
	self userAgent: aString.
	WAHtmlCanvas builder
		render: [ :html |
			self assert: html form isInternetExplorer = aBoolean ]