utilities
createJavascriptStringRenderable: aRenderable
	"Create a renderable that will render the string immediately on the response contents."

	^ (JSJavascriptStringRenderable on: aRenderable) 
			setContext: self renderContext;
			yourself