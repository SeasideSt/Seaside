updating
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot meta turboPrefetch: 'false'.
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'.
	aRoot javascript
		type: 'module';
		url: WATurboFileLibrary / #turboes2017esmminJs 