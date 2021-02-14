Class {
	#name : #SUDatePicker,
	#superclass : #WAMiniCalendar,
	#instVars : [
		'widgetId',
		'uid',
		'format',
		'origin',
		'containerId',
		'open'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #'instance creation' }
SUDatePicker class >> on: aId [ 
	^ self 
		on: aId
		container: nil
]

{ #category : #'instance creation' }
SUDatePicker class >> on: aId container: buttonId [ 
	^ self new
		widgetId: aId;
		containerId: buttonId;
		yourself
]

{ #category : #scripting }
SUDatePicker >> ajaxCallbackFor: aDate on: html [
	^ html prototype evaluator
		callback: [ :script | self scriptSelect: aDate on: script ];
		return: false
]

{ #category : #accessing }
SUDatePicker >> containerId [
	"Answer the value of containerId"
	^ containerId
]

{ #category : #accessing }
SUDatePicker >> containerId: anObject [ 
	"Set the value of containerId"
	containerId := anObject
]

{ #category : #accessing }
SUDatePicker >> format [
	"Answer the value of format"

	^ format ifNil: [ format := #(2 1 3 $/ 1 1) ]
]

{ #category : #accessing }
SUDatePicker >> format: anObject [
	"Set the value of format"

	format := anObject
]

{ #category : #accessing }
SUDatePicker >> formattedResult [
	^ self date printFormat: self format
]

{ #category : #initialization }
SUDatePicker >> initialize [
	super initialize.
	open := false.
	self date: Date today
]

{ #category : #accessing }
SUDatePicker >> isOpen [
	^ open
]

{ #category : #actions }
SUDatePicker >> nextMonthUpdateOn: aScript [
	self nextMonth.
	self scriptUpdateOn: aScript
]

{ #category : #actions }
SUDatePicker >> nextYear [
	self year: self year + 1
]

{ #category : #actions }
SUDatePicker >> nextYearUpdateOn: aScript [
	self nextYear.
	self scriptUpdateOn: aScript

]

{ #category : #scripting }
SUDatePicker >> openOn: aScript [ 
	| anElement |
	anElement := aScript prototype element id: containerId.
	anElement	
		absolutize;
		styleAt: 'left'
			put: origin x greaseString , 'px';
		styleAt: 'top'
			put: origin y greaseString , 'px'.
	self isOpen
		ifFalse: [
			anElement update: self.
			open := true ]
]

{ #category : #accessing }
SUDatePicker >> origin [
	^ origin
]

{ #category : #accessing }
SUDatePicker >> origin: aPoint [
	origin := aPoint
]

{ #category : #actions }
SUDatePicker >> previousMonthUpdateOn: aScript [
	self previousMonth.
	self scriptUpdateOn: aScript
]

{ #category : #actions }
SUDatePicker >> previousYear [
	self year: self year - 1
]

{ #category : #actions }
SUDatePicker >> previousYearUpdateOn: aScript [
	self previousYear.
	self scriptUpdateOn: aScript

]

{ #category : #rendering }
SUDatePicker >> renderBodyOn: html [
	html table
		cellspacing: 0;
		class: 'main';
		with: [ self renderCalendarOn: html ]

			
]

{ #category : #rendering }
SUDatePicker >> renderCalendarOn: html [
	html tableRow: [
		html tableHeading
			colSpan: 9;
			with: [ self renderMonthNavigationOn: html ] ].
	html tableRow
			class: 'calendarTitle';
			with: [
				self weekDays do: [ :each |
					html tableData
						class: 'weekDay';
						with: each ] ].
	self weeksDo: [ :week | self renderRowForWeek: week on: html ].
	html tableRow: [
		html tableData
			colSpan: 9;
			with: [ self renderYearNavigationOn: html ] ]	

			
]

{ #category : #rendering }
SUDatePicker >> renderCellForDate: aDate on: html [
	html tableData
		class: 'day';
		class: 'daySelected' if: self date = aDate;
		with: [
			aDate monthIndex = self monthIndex ifTrue: [
					(self canSelect: aDate)
						ifTrue: [
							html anchor
								class: 'today' if: aDate = Date today;
								onClick: (self ajaxCallbackFor: aDate on: html);
								with: aDate dayOfMonth ]
						ifFalse: [ html text: aDate dayOfMonth ] ] ]
]

{ #category : #rendering }
SUDatePicker >> renderContentOn: html [
	uid ifNil: [ uid := html nextId ].
	html div
		id: uid;
		class: 'calendar';
		with: [ self renderBodyOn: html ]
]

{ #category : #rendering }
SUDatePicker >> renderMonthNavigationOn: html [
html table class: 'monthTable';
	cellspacing:0;
	with: [	
		html tableRow
			class: 'monthRow';
			with: [
				html tableData
					class: 'calendarPrevious';
					with: [
						html anchor
							callback: [ self previousMonth ];
							onClick: (html prototype evaluator
									callback: [ :script |
										self previousMonthUpdateOn: script ];
							return: false);
							with: '<<' ].
				html tableData class: 'monthCurrent'; with: (Date nameOfMonth: self monthIndex).
				html tableData
					class: 'calendarNext';
					with: [
						html anchor
							callback: [ self nextMonth ] ;
							onClick: (html prototype evaluator
										callback: [ :script | 
											self nextMonthUpdateOn: script ];
										return: false);
							with: '>>' ] ] ]
]

{ #category : #rendering }
SUDatePicker >> renderYearNavigationOn: html [
	html table
		class: 'yearTable';
		cellspacing:0;
		with: [	
			html tableRow: [
				html tableData
					class: 'year';
					with: [
						html anchor
							callback: [ self previousYear ];
							onClick:	(html scriptaculous evaluator
										callback: [ :script |
											self previousYearUpdateOn: script ];
											return: false);
							with: (self year - 1) ].
				html tableData
					class: 'year';
					class: 'yearCurrent';
					with: (self year name).
				html tableData
					class: 'year';
					with: [
						html anchor
							callback: [ self nextYear ];
							onClick: ((html prototype evaluator)
										callback: [ :script | self nextYearUpdateOn: script ];
										return: false);
							with: (self year + 1) ] ] ]
]

{ #category : #scripting }
SUDatePicker >> scriptSelect: aDate on: script [ 
	"Ajax select"
	self select: aDate.
	widgetId isNil ifTrue: [ ^ self ].
	script prototype element
		id: widgetId;
		access: 'value';
		assign: self formattedResult.
	script prototype element
		id: uid;
		remove.
	open := false
]

{ #category : #scripting }
SUDatePicker >> scriptUpdateOn: script [
	script prototype element
		id: uid;
		update: [ :r | self renderBodyOn: r ]
]

{ #category : #public }
SUDatePicker >> setOriginWith: aString [
	| anArray |
	anArray := GRPlatform subStringsIn: aString splitBy: $,
		collect: [ :each | each select: [ :char | char isDigit ] ].
	anArray size > 1
		ifTrue: [ self origin: (Point x: (anArray at: 1) asNumber y: (anArray at: 2) asNumber + 20) ]
]

{ #category : #hooks }
SUDatePicker >> states [
	"Answer a collection of states that should be backtracked."

	^ #()
]

{ #category : #accessing }
SUDatePicker >> uid [
	"Answer the value of uid"

	^ uid
]

{ #category : #accessing }
SUDatePicker >> uid: anObject [
	"Set the value of uid"

	uid := anObject
]

{ #category : #updating }
SUDatePicker >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: SUComponentLibrary / #datePickerCss
]

{ #category : #accessing }
SUDatePicker >> widgetId [
	"Answer the value of widgetId"

	^ widgetId
]

{ #category : #accessing }
SUDatePicker >> widgetId: anObject [
	"Set the value of widgetId"

	widgetId := anObject
]
