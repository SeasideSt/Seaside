utilities
script: aBlock on: aStream
	"Evaluate aBlock and pass in a script object that is subsequently written to aStream."

	| script |
	self flag: #TODO. "questionalble API, receiver is already JSScript"
	script := (JSScript context: self renderContext)
		rendererClass: self rendererClass;
		yourself.
	aBlock value: script.
	JSJavascriptCanvas builder
		actionUrl: self renderContext actionUrl;
		resourceUrl: self renderContext resourceUrl;
		render: script
		on: aStream