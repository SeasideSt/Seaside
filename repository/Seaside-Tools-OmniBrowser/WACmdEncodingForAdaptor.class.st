Class {
	#name : #WACmdEncodingForAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #accessing }
WACmdEncodingForAdaptor >> codecs [
	^ GRCodec allCodecs asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #execution }
WACmdEncodingForAdaptor >> execute [
	| codec |
	codec := OBChoiceRequest
		prompt: 'Select encoding'
		labels: (self codecs 
			collect: [ :each | each name ]) 
		values: self codecs.
	codec isNil
		ifTrue: [ ^ self ].
	target adaptor codec: codec.
	requestor browser signalRefresh
]

{ #category : #testing }
WACmdEncodingForAdaptor >> isActive [
	^ requestor isSelected: target
]

{ #category : #accessing }
WACmdEncodingForAdaptor >> label [
	^ 'Encoding...'
]
