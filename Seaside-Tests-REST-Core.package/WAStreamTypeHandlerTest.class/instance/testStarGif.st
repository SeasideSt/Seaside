tests
testStarGif
	self assertPerformGetTo: #('star.gif') equals: handler starGif contentType: (WAMimeType fromString: 'image/gif')