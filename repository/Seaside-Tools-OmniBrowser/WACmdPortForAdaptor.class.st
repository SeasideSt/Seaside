Class {
	#name : #WACmdPortForAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #execution }
WACmdPortForAdaptor >> execute [
	| port |
	port := OBTextRequest 
		prompt: 'Enter port number'
		template: target adaptor port greaseString.
	(port isNil or: [ port isEmpty or: [ port isAllDigits not ] ]) ifTrue: [ ^ self ].
	target adaptor port: port greaseInteger.
	requestor browser signalRefresh
]

{ #category : #testing }
WACmdPortForAdaptor >> isActive [
	^ (requestor isSelected: target)
		and: [ target isStopped ]
]

{ #category : #accessing }
WACmdPortForAdaptor >> label [
	^ 'Port...'
]
