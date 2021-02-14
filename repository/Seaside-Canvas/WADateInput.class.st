"
I am a composition of three input fields that allow the user to select year, month and day. #options: can be used to toggle them individually.
The argument for my callback blocks is an instance of Date.

See WADateTimeTest >> #renderDateTimeOn:
"
Class {
	#name : #WADateInput,
	#superclass : #WACompound,
	#instVars : [
		'options',
		'month',
		'day',
		'year'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #private }
WADateInput >> addCallback [
	self hasCallback ifFalse: [
		canvas flush.
		^ self ].
	canvas hiddenInput
		callback: [ callbackBlock value: self setValueWithNewDate ];
		 with: nil
]

{ #category : #'private callbacks' }
WADateInput >> addDayCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self day: v ]
]

{ #category : #'private callbacks' }
WADateInput >> addMonthCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self month: v ]
]

{ #category : #'private callbacks' }
WADateInput >> addYearCallbackToBrush: aBrush [
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self year: v ]
]

{ #category : #'private callbacks' }
WADateInput >> day [
	^ day
]

{ #category : #'private callbacks' }
WADateInput >> day: anIntegerOrString [ 
	day := anIntegerOrString greaseInteger ifNil: [ 1 ]
]

{ #category : #private }
WADateInput >> defaultOptions [
	^ #(month day year)
]

{ #category : #'private callbacks' }
WADateInput >> month [
	^ month
]

{ #category : #'private callbacks' }
WADateInput >> month: anIntegerOrString [ 
	month := anIntegerOrString greaseInteger ifNil: [ 1 ]
]

{ #category : #accessing }
WADateInput >> options [
	^ options ifNil: [ self defaultOptions ]
]

{ #category : #accessing }
WADateInput >> options: anArray [
	"Valid values in the array : #year #month #day
	Can be used to control what is shown and in what order
	Default #(month day year)"
	options := anArray
]

{ #category : #'private-rendering' }
WADateInput >> renderDay [
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-day' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 2;
				print: day);
		yourself.
	self addDayCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 2;
		attributeAt: 'maxlength'
			put: 2
]

{ #category : #'private-rendering' }
WADateInput >> renderMonth [
	| brush |
	brush := canvas select
		id: self id;
		list: (1 to: 12);
		selected: month;
		yourself.
	self addMonthCallbackToBrush: brush.
	brush labels: [ :ea | Date nameOfMonth: ea ]
]

{ #category : #'private-rendering' }
WADateInput >> renderYear [
	| brush |
	brush := canvas textInput
		id: (self id isNil ifFalse: [ self id , '-year' ]);
		value: (GRNumberPrinter new
				padding: $0;
				digits: 4;
				print: year);
		yourself.
	self addYearCallbackToBrush: brush.
	brush
		attributeAt: 'size'
			put: 4;
		attributeAt: 'maxlength'
			put: 4
]

{ #category : #'private callbacks' }
WADateInput >> setValueWithNewDate [
	^ value := Date
		newDay: ((day min: (Date daysInMonth: (Date nameOfMonth: month) forYear: year)) max: 1)
		month: (Date nameOfMonth: month)
		year: year
]

{ #category : #public }
WADateInput >> with: anObject [
	super with: anObject.
	value isNil ifTrue: [ value := Date today ].
	day := value dayOfMonth.
	month := value monthIndex.
	year := value year.
	self options
		do: [ :each | self perform: ('render', each asLowercase capitalized) asSymbol ]
		separatedBy: [ canvas space ].
	self addCallback 

]

{ #category : #'private callbacks' }
WADateInput >> year [
	^ year
]

{ #category : #'private callbacks' }
WADateInput >> year: anIntegerOrString [ 
	year := anIntegerOrString greaseInteger ifNil: [ 1900 ]
]
