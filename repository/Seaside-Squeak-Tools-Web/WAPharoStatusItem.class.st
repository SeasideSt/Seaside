"
A WAPharoStatusItem is the abstract base class for other classes providing information about a specific aspect of this system.
"
Class {
	#name : #WAPharoStatusItem,
	#superclass : #WAStatusItem,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #testing }
WAPharoStatusItem class >> isAbstract [
	^ self name = #WAPharoStatusItem
]

{ #category : #private }
WAPharoStatusItem >> commandLineArgumentsFrom: aSmalltalkImage [ 
	| options |
	options := ((3 to: 1000)
		collect: [ :each |
			aSmalltalkImage getSystemAttribute: each ])
		select: [ :each | each notNil ].
	^ String streamContents: [ :stream | 
		options 
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream space ] ]
]

{ #category : #private }
WAPharoStatusItem >> days [
	^ GRPluggablePrinter on: 
		[ :duration | 
		| days |
		days := duration days.
		days > 0 
			ifTrue: [ (days pluralize: 'day') , ' ' ]
			ifFalse: [ '' ] ]
]

{ #category : #private }
WAPharoStatusItem >> durationPrinter [
	^ self days, self paddedHours, self paddedMinutes, self paddedSeconds
]

{ #category : #private }
WAPharoStatusItem >> image [
	^ SmalltalkImage current
]

{ #category : #private }
WAPharoStatusItem >> isRunningCog [
	^ (self image respondsTo: #isRunningCog) and: [ self image isRunningCog ]
]

{ #category : #private }
WAPharoStatusItem >> numberOfSessions [
	| count |
	count := 0.
	WASession allSubInstancesDo: [ :each | count := count + 1 ].
	^ count
]

{ #category : #private }
WAPharoStatusItem >> paddedHours [
	^ GRPluggablePrinter on: [ :duration | 
		| hours days |
		hours := duration hours.
		days := duration days.
		(hours isZero and: [ days isZero ]) 
			ifTrue: [ '' ]
			ifFalse: [
				((GRNumberPrinter new padding: $0; digits: 2) print: hours),
					(hours = 1  ifTrue: [ ' hr ' ] ifFalse: [ ' hrs ' ]) ] ]
]

{ #category : #private }
WAPharoStatusItem >> paddedMinutes [
	^ (GRMappedPrinter 
		block: [ :time | time minutes ]
		next: (GRNumberPrinter new padding: $0; digits: 2)) , ' min '
]

{ #category : #private }
WAPharoStatusItem >> paddedSeconds [
	^ (GRMappedPrinter 
		block: [ :time | time seconds ]
		next: (GRPrinter numberWithAtLeastDigits: 2)) , ' sec'
]

{ #category : #private }
WAPharoStatusItem >> percent: aDecimal [
	^ (GRSequentialPrinter new, (GRNumberPrinter new
			separator: $.;
			precision: 2;
			accuracy: 0.1;
			yourself), ' %') print: aDecimal * 100
]

{ #category : #private }
WAPharoStatusItem >> printDuration: aDuration [
	^ self durationPrinter print: aDuration
]

{ #category : #private }
WAPharoStatusItem >> printMemory: anInteger [ 
	^ GRPrinter binaryFileSize print: anInteger
]

{ #category : #private }
WAPharoStatusItem >> printMilliSeconds: aNumber [ 
	^ aNumber > 2000 
		ifTrue: [ self printDuration: (Duration milliseconds: aNumber greaseInteger) ]
		ifFalse: [
			aNumber > 2 
				ifTrue: [ aNumber greaseInteger printString , ' ms' ]
				ifFalse: [ (GRNumberPrinter new precision: 2) , ' ms' print: aNumber ] ]
]

{ #category : #private }
WAPharoStatusItem >> printMilliSeconds: aNumber dividedBy: divisor [
	^ divisor isZero
		ifTrue: [
			"avoid ZeroDivide"
			self printMilliSeconds: 0 ]
		ifFalse: [ self printMilliSeconds: aNumber / divisor ]
]

{ #category : #rendering }
WAPharoStatusItem >> renderCogValuesOn: html [
	"override if required"
]

{ #category : #rendering }
WAPharoStatusItem >> renderContentOn: html [
	"allow optional Cog parameters to be reported easily"
	html table: [
		self renderHeaderOn: html.
		self renderFooterOn: html.
		html tableBody
			class: self tableBodyCssClass;
			with: [ 
				self renderValuesOn: html.
				self isRunningCog  ifTrue: [
					self renderCogValuesOn: html ] ] ]
]

{ #category : #private }
WAPharoStatusItem >> vmOptionsFrom: aSmalltalkImage [ 
	| options |
	options := ((-1 to: -1000 by: -1)
		collect: [ :each |
			aSmalltalkImage getSystemAttribute: each ])
		select: [ :each | each notNil ].
	^ String streamContents: [ :stream | 
		options 
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream space ] ]
]
