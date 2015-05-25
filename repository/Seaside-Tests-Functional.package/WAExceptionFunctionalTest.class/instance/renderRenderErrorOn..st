rendering
renderRenderErrorOn: html
	"This is really hacky. We're trying to avoid depending on Flow here. Don't try this
	at home kids."
	renderError ifTrue: [
		"To fix the 'bug' evaluate the line below
		renderError := false. "
		self error: 'Error during rendering.' ].
	
	html heading: 'Error During Rendering'.
	html paragraph: 'This will trigger an error during the next render phase.'.
	html anchor
		callback: [ renderError := true ];
		with: 'Raise error'