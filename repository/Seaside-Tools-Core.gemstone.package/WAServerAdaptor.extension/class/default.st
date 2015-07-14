*seaside-tools-core
default
	"Helper method that returns a single adaptor of this class from the default ServerManager.
	If there are no adaptors of this class registered, return nil. If there are multiple adaptors
	of this type, signal an error."
	
	| adaptors |
	adaptors := WAAdmin serverAdaptors select: [ :each | each isKindOf: self ].
	(adaptors size > 1) ifTrue: [ self error: 'You cannot use this convenience method when more than one adaptor of the same type are registered. Use WAServerManager or a graphical interface when dealing with multiple adaptors of the same type.' ].
	^ adaptors isEmpty
		ifTrue: [ nil ]
		ifFalse: [ adaptors first ]