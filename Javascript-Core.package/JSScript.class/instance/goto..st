convenience
goto: aUrl 
	self add: (JSStream new
		nextPutAll: 'window.location=';
		javascript: aUrl)