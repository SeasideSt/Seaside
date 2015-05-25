convenience
with: anObject
	"Convenience method that answers a jQuery (instance) object. Pass it a symbol to reference an DOM id, a block to render new HTML nodes, a javascript object to be run at load time or a string to be used as a CSS query."
	
	anObject isNil
		ifTrue: [ ^ self new ].
	anObject isSymbol
		ifTrue: [ ^ self id: anObject ].
	anObject isBlock
		ifTrue: [ ^ self html: anObject ].
	anObject isJavascript
		ifTrue: [ ^ self ready: anObject ].
	^ self expression: anObject