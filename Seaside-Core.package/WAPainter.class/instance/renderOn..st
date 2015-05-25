rendering
renderOn: aRenderer
	"This method allows Painters to be passed into the #render: method of a Renderer.
	It should not normally be overridden. Subclasses should override #renderContentOn:.
	
	DO NOT call this method directly. Instead, pass this Painter as a parameter to the
	#render: method of aRenderer."
	
	self renderWithContext: aRenderer context