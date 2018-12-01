Class {
	#name : #SUDateTimePicker,
	#superclass : #SUDatePicker,
	#instVars : [
		'showSeconds',
		'hours',
		'minutes',
		'seconds'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #scripting }
SUDateTimePicker >> ajaxCallbackFor: aDate on: html [
	^ html prototype evaluator
		callback: [ :script | 
			self select: aDate.
			self scriptUpdateOn: script ];
		return: false
]

{ #category : #private }
SUDateTimePicker >> convertToInteger: aString max: maxValue [ 
	| anInteger |
	anInteger := aString greaseInteger.
	anInteger isNil ifTrue: [ ^ 0 ].
	^ (anInteger max: 0) min: maxValue
]

{ #category : #accessing }
SUDateTimePicker >> formattedResult [
	^ super formattedResult , ' ' , (self withLeadingZero: hours) , ':' , (self withLeadingZero: minutes) , ':'
		, (self withLeadingZero: seconds)
]

{ #category : #accessing }
SUDateTimePicker >> hours [
	^ hours
]

{ #category : #accessing }
SUDateTimePicker >> hours: anObject [
	hours := self convertToInteger: anObject max: 23
]

{ #category : #initialization }
SUDateTimePicker >> initialize [
	| now |
	super initialize.
	showSeconds := false.
	now := DateAndTime now.
	hours := now hour.
	minutes := now minute.
	seconds := 0
]

{ #category : #accessing }
SUDateTimePicker >> minutes [
	^ minutes
]

{ #category : #accessing }
SUDateTimePicker >> minutes: anObject [
	minutes := self convertToInteger: anObject max: 59
]

{ #category : #rendering }
SUDateTimePicker >> renderBodyOn: html [
	html table
		cellspacing: 0;
		class: 'main';
		with: [
			self renderCalendarOn: html.
			self renderTimeOn: html ]

			
]

{ #category : #rendering }
SUDateTimePicker >> renderTimeOn: html [
	html tableRow: [
		html tableData
			class: 'time';
			colSpan: 9;
			align: 'center';
			with: [
				html form 
					id: self timeId;
					with: [
						html textInput
							maxLength: 2;
							value: (self withLeadingZero: hours);
							callback: [ :v | self hours: v ].
						html text: ':'.
						html textInput
							maxLength: 2;
							value: (self withLeadingZero: minutes);
							callback: [ :v | self minutes: v ].
						showSeconds ifTrue: [
							html text: ':'.
							html textInput
								maxLength: 2;
								value: (self withLeadingZero: seconds);
								callback: [ :v | self seconds: v ] ].
						html space.
						html anchor
							class: 'button';
							onClick: (self triggerFormOn: html);
							with: 'Ok' ] ] ]
]

{ #category : #accessing }
SUDateTimePicker >> seconds [
	^ seconds
]

{ #category : #accessing }
SUDateTimePicker >> seconds: anObject [
	seconds := self convertToInteger: anObject max: 59
]

{ #category : #accessing }
SUDateTimePicker >> timeId [
	^ 'time_' , uid
]

{ #category : #scripting }
SUDateTimePicker >> triggerFormOn: html [
	^ html prototype evaluator
		triggerForm: self timeId;
		callback: [ :script | self scriptSelect: self date on: script ];
		return: false
]

{ #category : #private }
SUDateTimePicker >> withLeadingZero: anInteger [ 
	^ anInteger < 10 
		ifTrue: [ '0' , anInteger greaseString ]
		ifFalse: [ anInteger greaseString ]
]
