Extension { #name : #WAServerAdaptor }

{ #category : #'*seaside-tools-core' }
WAServerAdaptor classSide >> default [
	"Helper method that returns a single adaptor of this class from the default WAServerManager.
	If there are no adaptors of this class registered, return nil. If there are multiple adaptors
	of this type, signal an error."
	
	| adaptors |
	adaptors := WAAdmin serverAdaptors select: [ :each | each isKindOf: self ].
	(adaptors size > 1) ifTrue: [ self error: 'You cannot use this convenience method when more than one adaptor of the same type are registered. Use WAServerManager or a graphical interface when dealing with multiple adaptors of the same type.' ].
	^ adaptors isEmpty
		ifTrue: [ nil ]
		ifFalse: [ adaptors first ]
]

{ #category : #'*seaside-tools-core' }
WAServerAdaptor classSide >> start [
	"Convenience method to start a single already registered adaptor of the type of the
	receiver."

	self default start
]

{ #category : #'*seaside-tools-core' }
WAServerAdaptor classSide >> startOn: portInteger [
	"Convenience method to start a single adaptor on the specified port. If an existing
	adaptor of this type is already registered, it will be restarted on the specified port."

	| adaptor |
	adaptor := self default.
	adaptor isNil
		ifFalse: [ adaptor stop; port: portInteger ]
		ifTrue: [ adaptor := self port: portInteger ].
	adaptor start
]

{ #category : #'*seaside-tools-core' }
WAServerAdaptor classSide >> stop [
	"Convenience method to stop a currently running adaptor of the type of the receiver
	as long as there is only one such adaptor currently registered."

	| default |
	default := self default.
	default isNil ifFalse: [ default stop ]
]
