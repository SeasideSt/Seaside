public
javascript: aBlock
	"Evaluate aBlock with an JSScript instance and pushes the resulting script-string aString to all associated handlers."

	| script |
	script := (JSScript context: self renderContext)
		rendererClass: self rendererClass;
		yourself.
	aBlock value: script.
	self push: (String streamContents: [ :stream |
		stream
			nextPutAll: '<script type="text/javascript">parent.Comet.eval(';
			javascript: script asJavascript;
			nextPutAll: ')</script>' ])