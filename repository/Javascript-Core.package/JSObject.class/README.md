I represent the abstract root of all JavaScript objects in the Smalltalk world. My subclasses provide accessors and action methods to configure instances of myself and implement the method #javascriptContentOn: to emit valid JavaScript code for my presentation.

Instance Variables
	decoration:			<JSObject|JSDecoration>
	renderContext:		<WARenderContext>
	rendererClass:		<WARenderer>