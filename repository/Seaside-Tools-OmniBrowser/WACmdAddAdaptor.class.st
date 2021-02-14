Class {
	#name : #WACmdAddAdaptor,
	#superclass : #OBCommand,
	#category : 'Seaside-Tools-OmniBrowser-Commands'
}

{ #category : #accessing }
WACmdAddAdaptor >> adaptors [
	^ (WAServerAdaptor allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #execution }
WACmdAddAdaptor >> execute [
	| class port adaptor |
	class := OBChoiceRequest 
		prompt: 'Chose adaptor type'
		labels: (self adaptors collect: [ :each | each name ])
		values: self adaptors.
	class isNil ifTrue: [ ^ self ].
	port := OBTextRequest 
		prompt: 'Enter port number'
		template: class basicNew defaultPort greaseString.
	(port isNil or: [ port isEmpty or: [ port isAllDigits not ] ]) ifTrue: [ ^ self ].
	adaptor := class port: port greaseInteger.
	requestor browser announce: (OBNodeCreated node: adaptor asNode)
]

{ #category : #accessing }
WACmdAddAdaptor >> group [
	^ #changing
]

{ #category : #testing }
WACmdAddAdaptor >> isActive [
	^ (requestor isSelected: target) not
]

{ #category : #accessing }
WACmdAddAdaptor >> label [
	^ 'Add adaptor...'
]
