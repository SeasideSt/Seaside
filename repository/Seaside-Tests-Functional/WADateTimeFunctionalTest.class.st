Class {
	#name : #WADateTimeFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'date',
		'time',
		'message'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WADateTimeFunctionalTest >> date [
	^ date
]

{ #category : #accessing }
WADateTimeFunctionalTest >> date: aDate [
	date := aDate
]

{ #category : #rendering }
WADateTimeFunctionalTest >> renderContentOn: html [
	self renderDateTimeOn: html.
	self renderDeadDateTimeOn: html
]

{ #category : #rendering }
WADateTimeFunctionalTest >> renderDateTimeOn: html [ 
	html heading
		level3;
		with: 'Form with #dateInput and #timeInput'.
	html form
		defaultAction: [ message := 'Default action: ' , date greaseString , ' ' , time greaseString ];
		with: [
			html div: [
				" use #callback: and #with: "
				html dateInput
					callback: [ :value | self date: value ];
					with: self date.
				html space: 10.
				" use #on:of: "
				html timeInput
					withSeconds;
					on: #time of: self.
				html break.
				html text: message.
				html break.
				html submitButton 
					callback: [ message := 'Button action: ' , date greaseString , ' ' , time greaseString ] ] ]
]

{ #category : #rendering }
WADateTimeFunctionalTest >> renderDeadDateTimeOn: html [
	html heading
		level: 3;
		with: 'Div with #dateInput and #timeInput, no callback'.
	html form: [
		html div: [
			html dateInput value: Date today.
			html space: 10.
			html timeInput withSeconds; with: Time now.
			html break.
			html withLineBreaks: 'The year portion of the date should be visible.
				The seconds portion of the time should be visible.
				Exactly one date and one time selector should be visible.' ] ]
]

{ #category : #accessing }
WADateTimeFunctionalTest >> time [
	^ time
]

{ #category : #accessing }
WADateTimeFunctionalTest >> time: aTime [
	time := aTime
]
