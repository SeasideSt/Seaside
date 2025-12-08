utilities
jsStringWith: aRenderable
	"Create a renderable that will render the string immediately on the response contents."

	^ (JSString context: self renderContext) 
			setRenderable: aRenderable;
			yourself