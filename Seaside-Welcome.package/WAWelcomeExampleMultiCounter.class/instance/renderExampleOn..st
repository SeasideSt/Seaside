rendering
renderExampleOn: html
	html paragraph: [
		html text: 'Multicounter is a simple extension to the '.
		html anchor callback: [ self show: WAWelcomeExampleCounter new ]; with: 'Counter'.
		html text: ' application. It displays several instances of the same '.
		html anchor callback: [ self show: WAWelcomeExampleCounter new ]; with: 'Counter'.
		html text: ' component:'
		].
	
	html div class: #seasideExample; with: multicounter.
	
	html paragraph: [
		html text: 'This component is implemented in a few lines of code. The code is contained in the class '; code: 'WAMultiCounter'; text: ', a subclass of '; code: 'WAComponent. ' ].

	html paragraph: 'The first method is used to initialize the component, in this case we instantiate 5 counters:'.
	 
	self renderInitializeCodeOn: html.
	
	html paragraph: 'We then tell Seaside which child components we intend to display. In our case this is just the collection of counter instances:'.
	
	self renderChildrenCodeOn: html.
	
	html paragraph: 'Finally we display each of the components separated by a horizontal rule:'.
	
	self renderRenderContentsOnCodeOn: html
	
