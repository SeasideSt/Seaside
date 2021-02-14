Class {
	#name : #JQRepeatingFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQRepeatingFunctionalTest >> renderContentOn: html [
	html paragraph
		script: (html jQuery this load
			html: [ :r | self renderTimeOn: r ];
			interval: 1 seconds);	
		with: [ self renderTimeOn: html ]
]

{ #category : #rendering }
JQRepeatingFunctionalTest >> renderTimeOn: html [
	html render: DateAndTime now
]

{ #category : #accessing }
JQRepeatingFunctionalTest >> selectors [
	^ #(renderContentOn: renderTimeOn:)
]

{ #category : #accessing }
JQRepeatingFunctionalTest >> title [
	^ 'Repeated Ajax Calls'
]
