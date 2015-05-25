uploaded
mainCss
	^ WAFileLibraryResource
		filepath: 'main.css'
		mimeType: WAMimeType textCss
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #mainCssContent)