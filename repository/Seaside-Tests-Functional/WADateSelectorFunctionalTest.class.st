Class {
	#name : 'WADateSelectorFunctionalTest',
	#superclass : 'WAFunctionalTest',
	#instVars : [
		'beginDate',
		'endDate',
		'beginTime',
		'endTime',
		'beginDAT',
		'endDAT'
	],
	#category : 'Seaside-Tests-Functional',
	#package : 'Seaside-Tests-Functional'
}

{ #category : 'hooks' }
WADateSelectorFunctionalTest >> children [
	^ OrderedCollection new
		add: beginDate;
		add: endDate;
		add: beginTime;
		add: endTime;
		add: beginDAT;
		add: endDAT;
		yourself
]

{ #category : 'actions' }
WADateSelectorFunctionalTest >> computeDuration [
	| dateDiff |
	dateDiff := (endDAT dateAndTime asDate - beginDAT dateAndTime asDate) days.
	dateDiff isZero 
		ifFalse: [
			self 
				inform: dateDiff greaseString , ' day(s)'
				onAnswer: [ ] ]
		ifTrue: [
			self 
				inform: (endDAT dateAndTime asTime subtractTime: beginDAT dateAndTime asTime) asSeconds greaseString , ' second(s)'
				onAnswer: [ ] ]
]

{ #category : 'initialization' }
WADateSelectorFunctionalTest >> initialize [
	super initialize.
	beginDate := WADateSelector new.
	endDate := WADateSelector new.
	endDate date: (Date today addDays: 1).

	beginTime := WATimeSelector new.
	beginTime time: Time now.
	endTime := WATimeSelector new.
	endTime time: (beginTime time addSeconds: 3600).

	beginDAT := WADateTimeSelector new.
	endDAT := WADateTimeSelector new.
	endDAT dateAndTime: beginDAT dateAndTime + 1 days + 1 hours
]

{ #category : 'rendering' }
WADateSelectorFunctionalTest >> renderContentOn: html [

	self renderDateSelectorsOn: html.
	html horizontalRule.
	self renderTimeSelectorsOn: html.
	html horizontalRule.
	self renderDateTimeSelectorsOn: html
]

{ #category : 'rendering' }
WADateSelectorFunctionalTest >> renderDateSelectorsOn: html [
  html heading
    level3;
    with: 'Dates'.
  html form
    id: #'dateForm';
    with: [ 
          html
            table: [ 
              html tableRow
                class: 'from';
                with: [ 
                      html
                        tableData: 'From';
                        tableData: beginDate ].
              html tableRow
                class: 'to';
                with: [ 
                      html
                        tableData: 'To';
                        tableData: endDate ] ].
          html
            div: [ 
              html submitButton
                callback: [ 
                      self
                        inform:
                          (endDate date subtractDate: beginDate date) greaseString , ' day(s)'
                        onAnswer: [  ] ];
                text: 'Compute duration' ] ]
]

{ #category : 'rendering' }
WADateSelectorFunctionalTest >> renderDateTimeSelectorsOn: html [
	html heading level3; with: 'Dates and Times'.
	html form id: #dateTimeForm; with: [
		html table: [
			html tableRow
				class:'from';
				with:[ html tableData: 'From'; tableData: beginDAT ].
			html tableRow
				class:'to';
				with:[ html tableData: 'To'; tableData: endDAT ] ].
		html div: [
			html submitButton
				callback: [ self computeDuration ];
				text: 'Compute duration' ] ]
]

{ #category : 'rendering' }
WADateSelectorFunctionalTest >> renderTimeSelectorsOn: html [ 
	html heading
		level3;
		with: 'Times'.
	html form id: #timeForm; with: [
		html table: [
			html tableRow
				class:'from';
				with:[ 
					html
						tableData: 'From';
						tableData: beginTime ].
			html tableRow
				class:'to';
				with:[
					html
						tableData: 'To';
						tableData: endTime ] ].
		html div: [
			html submitButton
				callback: [
					self 
						inform: (endTime time subtractTime: beginTime time) asSeconds greaseString , ' second(s)'
						onAnswer: [ ] ];
				text: 'Compute duration' ] ]
]
