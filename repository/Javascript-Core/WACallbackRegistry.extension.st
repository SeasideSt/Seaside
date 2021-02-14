Extension { #name : #WACallbackRegistry }

{ #category : #'*javascript-core' }
WACallbackRegistry >> passengerAt: aString [
	^ self passengerAt: aString ifAbsent: [ nil ]
]

{ #category : #'*javascript-core' }
WACallbackRegistry >> passengerAt: aString ifAbsent: aBlock [
	| passenger |
	passenger := callbacks at: aString ifAbsent: [ ^ aBlock value ].
	passenger isPassenger ifFalse: [ ^ aBlock value ].
	^ passenger object
]

{ #category : #'*javascript-core' }
WACallbackRegistry >> registerPassenger: anObject named: aString [
	| callback |
	callback := JSPassenger new.
	callback setKey: aString callbacks: callbacks; setObject: anObject.
	callbacks at: (callback convertKey: aString) put: callback.
	^ aString
]
