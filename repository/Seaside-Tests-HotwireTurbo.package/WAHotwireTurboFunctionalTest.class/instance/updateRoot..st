updating
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'.
	aRoot javascript
		type: 'module';
		"url: 'https://cdn.jsdelivr.net/npm/@hotwired/turbo@latest/dist/turbo.es2017-esm.min.js'."
		url: WATurboFileLibrary / #turboes2017esmminJs 