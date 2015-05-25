rendering
renderContentOn: aRenderer
	"By default, render all our children in order. Presenters should override this method
	to specify how they should render themselves. By convention, implementations of this
	method that expect a Canvas renderer use 'html' as the parameter name.
	See also #rendererClass."
	
	self childrenDo: [ :each | aRenderer render: each ]