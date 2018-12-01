"
I am a composition of three input fields that allows the user to select hour, minute and optionally second.
#withSeconds and #withoutSeconds can be used to toggle seconds.

The argument for my callback blocks is an instance of Time.

See WADateTimeTest >> #renderDateTimeOn:
"
Class {
	#name : #WATimeInput,
	#superclass : #WACompound,
	#instVars : [
		'withSeconds',
		'hours',
		'minutes',
		'seconds'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WATimeInput >> addCallback [
	self hasCallback ifFalse: [
		canvas flush.
		^ self ].
	canvas hiddenInput
		callback: [ callbackBlock value: self setValueWithNewTime ];
		 with: nil
]

{ #category : #'private callbacks' }
WATimeInput >> addHoursCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self hours: v ]
]

{ #category : #'private callbacks' }
WATimeInput >> addMinutesCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self minutes: v ]
]

{ #category : #'private callbacks' }
WATimeInput >> addSecondsCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self seconds: v ]
]

{ #category : #'private callbacks' }
WATimeInput >> hours [
	^ hours
]

{ #category : #'private callbacks' }
WATimeInput >> hours: anIntegerOrString [ 
	hours := anIntegerOrString greaseInteger ifNil: [ 0 ]
]

{ #category : #initialization }
WATimeInput >> initialize [
	super initialize.
	self withoutSeconds
]

{ #category : #'private callbacks' }
WATimeInput >> minutes [
	^ minutes
]

{ #category : #'private callbacks' }
WATimeInput >> minutes: anIntegerOrString [ 
	minutes := anIntegerOrString greaseInteger ifNil: [ 0 ]
]

{ #category : #'private-rendering' }
WATimeInput >> renderHours [
	| brush |
	brush := canvas textInput
		id: self id;
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: hours).
	self addHoursCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2
]

{ #category : #'private-rendering' }
WATimeInput >> renderMinutes [
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-mins' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: minutes);
		yourself.
	self addMinutesCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2
]

{ #category : #'private-rendering' }
WATimeInput >> renderSeconds [
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-secs' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: seconds);
		yourself.
	self addSecondsCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2
]

{ #category : #'private callbacks' }
WATimeInput >> seconds [
	^ seconds
]

{ #category : #'private callbacks' }
WATimeInput >> seconds: anIntegerOrString [
	seconds := [ anIntegerOrString asNumber ] on: Error do: [ :e | 0 ]
]

{ #category : #'private callbacks' }
WATimeInput >> setValueWithNewTime [
	^ value := Time hour: hours minute: (minutes min: 59) second: (seconds min: 59)
]

{ #category : #public }
WATimeInput >> with: anObject [
	super with: anObject.
	value isNil
		ifTrue: [ value := Time now ].
	hours := value hour.
	minutes := value minute.
	seconds := value second.
	self renderHours.
	canvas
		space;
		text: ':';
		space.
	self renderMinutes.
	withSeconds
		ifTrue: [ 
			canvas
				space;
				text: ':';
				space.
			self renderSeconds ]
		ifFalse: [ seconds := 0 ].
	self addCallback
]

{ #category : #accessing }
WATimeInput >> withSeconds [
	withSeconds := true
]

{ #category : #accessing }
WATimeInput >> withoutSeconds [
	withSeconds := false
]
