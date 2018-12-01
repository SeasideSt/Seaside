"
WAMiniCalendar renders a monthly calendar. Users can navigate by month, year, or select a year and a month. Users can select a date in the calendar. Set canSelectBlock to control which dates a user can select. Use selectBlock to perform an action when a user selects a date. WAMiniCalendar>>date returns the selected date.

Select ""Mini Calendar"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/tests/functional/WAMiniCalendarFunctionalTest)

Instance Variables:
	canSelectBlock		<BlockClosure with date argument>	return true if date argument should be rendered with a link, ie user can select that date
	date				<WAValueHolder on a date>	Selected date
	monthIndex			<WAValueHolder on an Integer>	Currently displayed month
	year				<WAValueHolder on an Integer>	Currently displayed year
	selectBlock			<BlockClosure with date argument> called when user selects a date


"
Class {
	#name : #WAMiniCalendar,
	#superclass : #WACanvasWidget,
	#instVars : [
		'monthIndex',
		'year',
		'date',
		'canSelectBlock',
		'selectBlock'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #testing }
WAMiniCalendar class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAMiniCalendar class >> exampleComponent [
	^ self new
]

{ #category : #testing }
WAMiniCalendar >> canSelect: aDate [
	^ canSelectBlock value: aDate
]

{ #category : #accessing }
WAMiniCalendar >> canSelectBlock: aBlock [
	canSelectBlock := aBlock
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> date [
	^ date contents
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> date: aDate [ 
	date contents: aDate.
	monthIndex contents: aDate monthIndex.
	year contents: aDate year
]

{ #category : #initialization }
WAMiniCalendar >> initialize [
	super initialize.
	monthIndex := WAValueHolder with: Date today monthIndex.
	year := WAValueHolder with: Date today year.
	date := WAValueHolder new.
	canSelectBlock := [ :value | true ].
	selectBlock := [ :value | self answer: value ]
]

{ #category : #private }
WAMiniCalendar >> monthHeading [
	^ self monthName , ' ' , self year greaseString
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> monthIndex [
	^ monthIndex contents
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> monthIndex: anInteger [ 
	monthIndex contents: anInteger
]

{ #category : #private }
WAMiniCalendar >> monthName [
	^ Date nameOfMonth: self monthIndex
]

{ #category : #localization }
WAMiniCalendar >> monthNames [
	^ (1 to: 12) collect: [ :each | Date nameOfMonth: each ]
]

{ #category : #action }
WAMiniCalendar >> nextMonth [
	self monthIndex = 12
		ifTrue: [ self monthIndex: 1; year: self year + 1 ]
		ifFalse: [ self monthIndex: self monthIndex + 1 ]
]

{ #category : #action }
WAMiniCalendar >> previousMonth [
	self monthIndex = 1
		ifTrue: [ self monthIndex: 12; year: self year - 1 ]
		ifFalse: [ self monthIndex: self monthIndex - 1 ]

]

{ #category : #rendering }
WAMiniCalendar >> renderCellForDate: aDate on: html [
	html tableData: [
		(aDate monthIndex = self monthIndex and: [ aDate year = self year ])
			ifTrue: [
				html span
					class: (self date = aDate ifTrue: [ 'calendarArchiveDate' ]);
					with: [
						(self canSelect: aDate) 
							ifTrue: [
								html anchor
									callback: [ self select: aDate ];
									with: aDate dayOfMonth ]
							ifFalse: [ html text: aDate dayOfMonth ] ] ] ]
]

{ #category : #rendering }
WAMiniCalendar >> renderContentOn: html [
	html div
		class: 'calendar';
		with: [
			html div
				class: 'calendarCaption';
				with: [ self renderMonthHeadingOn: html ].
			html table: [
				html tableRow
					class: 'calendarTitle';
					with: [
						self weekDays do: [ :each |
							html tableData: each ] ].
						self weeksDo: [ :week |
							self renderRowForWeek: week on: html ] ].
			self renderMonthNavigationOn: html.
			html
				space;
				space.
			self renderYearNavigationOn: html ]
]

{ #category : #rendering }
WAMiniCalendar >> renderMonthHeadingOn: html [
	html form: [
		html div: [
			html select
				list: (1 to: 12);
				on: #monthIndex of: self;
				labels: [ :index | Date nameOfMonth: index ].
			html textInput
				maxLength: 4;
				on: #year of: self.
			html submitButton text: 'Refresh' ] ]
]

{ #category : #rendering }
WAMiniCalendar >> renderMonthNavigationOn: html [
	| tab |
	tab := #(12 1 2 3 4 5 6 7 8 9 10 11 12 1).
	html span
		class: 'calendarPrevious';
		with: [
			html anchor
				callback: [ self previousMonth ];
				with: ((self monthNames at: (tab at: self monthIndex)) first: 3) ].
	html space.
	html span
		class: 'calendarNext';
		with: [
			html anchor
				callback: [ self nextMonth ];
				with: ((self monthNames at: (tab at: self monthIndex + 2)) first: 3) ]
]

{ #category : #rendering }
WAMiniCalendar >> renderRowForWeek: initialDay on: html [
	html tableRow: [
		0 to: 6 do: [ :each |
			self renderCellForDate: (initialDay addDays: each) on: html ] ]
]

{ #category : #rendering }
WAMiniCalendar >> renderYearNavigationOn: html [
	html span
		class: 'calendarPrevious';
		with: [
			html anchor
				callback: [ self year: self year - 1 ];
				with: self year - 1 ].
	html space.
	html span
		class: 'calendarNext';
		with: [
			html anchor
				callback: [ self year: self year + 1 ];
				with: self year + 1 ]
]

{ #category : #action }
WAMiniCalendar >> select: aDate [
	self date: aDate.
	selectBlock value: aDate
]

{ #category : #accessing }
WAMiniCalendar >> selectBlock: aBlock [
	selectBlock := aBlock
]

{ #category : #hooks }
WAMiniCalendar >> states [
	^ Array with: date with: monthIndex with: year
]

{ #category : #private }
WAMiniCalendar >> weekDays [
	^ #(Sun Mon Tue Wed Thu Fri Sat)
]

{ #category : #private }
WAMiniCalendar >> weeksDo: aBlock [
	| day nextMonth |
	day := Date newDay: 1 month: (Date nameOfMonth: self monthIndex) year: self year.
	day := day subtractDays: (day dayOfWeek - 1).
	nextMonth := (self monthIndex \\ 12) + 1.
	[ day monthIndex = nextMonth ] whileFalse: [
		aBlock value: day.
		day := day addDays: 7 ]
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> year [
	^ year contents
]

{ #category : #'accessing-delegated' }
WAMiniCalendar >> year: anIntegerOrString [ 
	year contents: (anIntegerOrString greaseInteger ifNil: [ 1900 ])
]
