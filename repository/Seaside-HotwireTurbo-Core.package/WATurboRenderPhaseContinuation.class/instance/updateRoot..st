updating
updateRoot: aRoot

	super updateRoot: aRoot.
	"In the Seaside heretic framework, callbacks modify state. So do not prefetch them!"
	aRoot meta turboPrefetch: 'false'.
	"TODO: how to avoid the meta header to be removed when a single frame is replaced? Then we do not need the bodyAttribute anymore..."
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'.
	aRoot javascript
		type: 'module';
		url: WATurboFileLibrary / #turboes2017esmminJs 