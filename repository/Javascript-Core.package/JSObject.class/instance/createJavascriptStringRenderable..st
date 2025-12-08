utilities
createJavascriptStringRenderable: aRenderable
	"Create a renderable that will render the string immediately on the response contents."

	^ (JSJavascriptStringRenderable context: self renderContext) 
			setRenderable: aRenderable;
			yourself