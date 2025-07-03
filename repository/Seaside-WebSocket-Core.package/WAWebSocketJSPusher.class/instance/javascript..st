public
javascript: aBlock

	"Evaluate aBlock with an JSScript instance and pushes the resulting script-string aString to all associated websockets."

	| script |
	script := (JSScript context: self renderContext)
		          rendererClass: self rendererClass;
		          yourself.
	aBlock value: script.
	self push: (String streamContents: [ :stream | stream javascript: script ])