utilities
jsStringWith: aRenderable
	"Create a renderable that will render the string immediately on the response stream."

	^ (JSString context: self renderContext)
	      rendererClass: self rendererClass; 
			setRenderable: aRenderable;
			yourself