Class {
	#name : #WAObjectLog,
	#superclass : #WAComponent,
	#instVars : [
		'summaryReport',
		'report',
		'filter'
	],
	#category : 'Seaside-GemStone-Tools-Production-ObjectLog'
}

{ #category : #testing }
WAObjectLog class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAObjectLog class >> description [
	^ 'Seaside component for viewing OTRemoteDebugger object log contents.'
]

{ #category : #accessing }
WAObjectLog class >> entryPointName [
	^'tools/objectLog'
]

{ #category : #initialization }
WAObjectLog class >> initialize [
	"WAAdmin register: self asApplicationAt: self entryPointName"
]

{ #category : #accessing }
WAObjectLog >> children [
	^ Array with: report with: summaryReport
]

{ #category : #actions }
WAObjectLog >> debugContinuation: aLogEntry [
  | continuation |
  (aLogEntry isKindOf: DebuggerLogEntry)
    ifTrue: [ 
      continuation := aLogEntry continuation.
      continuation
        ifNotNil: [ 
          ((continuation isKindOf: GsProcess) and: [ continuation isContinuation ])
            ifTrue: [ 
              | comp exception |
              comp := WAGemStoneContinuationDebugger new.
              comp initializeWithContinuation: continuation.	"exception :=  (continuation convertToPortableStack _frameContentsAt: 1) at: 11."
              self session presenter call: comp ] ] ]
]

{ #category : #actions }
WAObjectLog >> deleteAllAtPriority: aSummaryEntry [

	| priority log |
	priority := aSummaryEntry key.
	log := self objectLogEntries: true.
	(log select: [:ea | ea priority == priority ]) do: [:ea |  log remove: ea ifAbsent: []].
]

{ #category : #actions }
WAObjectLog >> deleteLogEntriesUpToInclusive: anObjectLogEntry [

	| entries index log |
	entries := report rows.
	index := entries indexOf: anObjectLogEntry.
	log := self objectLogEntries: true.
	(entries copyFrom: 1 to: index) do: [:ea |
		 log remove: ea ifAbsent: []].
]

{ #category : #actions }
WAObjectLog >> deleteLogEntry: anObjectLogEntry [

	|  log |
	log := self objectLogEntries: true.
	log remove: anObjectLogEntry ifAbsent: []
]

{ #category : #initialization }
WAObjectLog >> initialize [
	| columns summaryColumns labels |
	super initialize.
	columns := (OrderedCollection new)
		add: ((WAReportColumn
			selector: #priorityString title: 'priority')
			sortBlock: [:a :b | a < b ];
			clickBlock: [:each | self call: (WAObjectLogInspector on: each)]);
		add: ((WAReportColumn
			selector: #labelText title: 'Label')
			formatBlock: [:ea | ea ];
			sortBlock: [:a :b | a asString < b asString]);
		add: ((WAReportColumn
			selector: #pidString title: 'pid')
			sortBlock: [:a :b | a asNumber < b asNumber ]);
		add: ((WAReportColumn
			selector: #stampString 
			title: 'time')
			sortBlock: [:a :b | a > b ]);
		add: ((WAReportColumn
			selector: #requestString
			title: 'url')
			sortBlock: [:a :b | a < b ]);
		add: ((WAReportColumn
			selector: #objectString 
			title: 'object')
			sortBlock: [:a :b | a asString < b asString]);
		add: ((WAReportColumn
			selector: #deleteString title: 'delete down to'
			onClick: [ :each | self deleteLogEntriesUpToInclusive: each ])
			sortBlock: nil);
		add: ((WAReportColumn
			selector: #debugContinuationString title: 'debug continuation'
			onClick: [ :each | self debugContinuation: each ])
			sortBlock: nil);
		add: ((WAReportColumn
			renderBlock: [ :each :html | 
				html anchor
					callback: [ self deleteLogEntry: each ];
					title: 'delete entry';
					with: 'me' ]
			title: 'delete')
			sortBlock: nil);
		yourself.
	report := WAObjectLogTableReport new
		rows: self objectLogEntries;
		columns: columns;
		rowColors: #(lightblue lightyellow);
		rowPeriod: 1;
		yourself.
	labels := self labels.
	summaryColumns := (OrderedCollection new)
		add: ((WAReportColumn
			renderBlock: [ :each :html | 
				html text: (labels at: each key) ]
			title: 'name')
			sortBlock: nil);
		add: ((WAReportColumn
			selector: #key title: 'priority')
			sortBlock: [:a :b | a < b ]);
		add: ((WAReportColumn
			selector: #value title: 'count')
			sortBlock: [:a :b | a < b ]);
		add: ((WAReportColumn
			renderBlock: [ :each :html | 
				each value == 0
					ifTrue: [ html text: '-' ]
					ifFalse: [
						html anchor
							callback: [ self deleteAllAtPriority: each ];
							title: 'delete';
							with: 'all ', (labels at: each key)] ]
			title: 'delete')
			sortBlock: nil);
		yourself.
	summaryReport := WAObjectLogTableReport new
		rows: self objectLogSummary;
		columns: summaryColumns;
		rowPeriod: 1;
		yourself.
]

{ #category : #initialization }
WAObjectLog >> labels [

	^#('fatal' 'error' 'warn' 'info' 'debug' 'trace' 'transcript' 'inspect').
]

{ #category : #accessing }
WAObjectLog >> objectLogEntries [

	^ self objectLogEntries: false
]

{ #category : #accessing }
WAObjectLog >> objectLogEntries: shouldLock [

	shouldLock 
		ifTrue: [
			System writeLock: ObjectLogEntry objectQueue
				ifDenied: [ 
					WARetryHttpRequest signal: 'ObjectLogEntry objectQueue lock denied'.
					"does not return" ]
				ifChanged: [ 
					System addToCommitOrAbortReleaseLocksSet: ObjectLogEntry objectQueue.
					WARetryHttpRequest signal: 'ObjectLogEntry objectQueue lock dirty'.
					"does not return" ].
			System addToCommitOrAbortReleaseLocksSet: ObjectLogEntry objectQueue].
	^ObjectLogEntry objectLog
]

{ #category : #accessing }
WAObjectLog >> objectLogSummary [

	| sums summary |
	sums := Dictionary new.
	1 to: self labels size do: [:i | sums at: i put: 0 ].
	self objectLogEntries do: [:ea | | tally |
		tally := sums at: ea priority.
		sums at: ea priority put: (tally + 1)].
	summary := Array new: self labels size.
	1 to: self labels size do: [:i| summary at: i put: (sums associationAt: i) ].
	^summary
]

{ #category : #rendering }
WAObjectLog >> renderContentOn: html [

	| rows |
	html heading: 'Object Log [', self objectLogEntries size printString, ']'.
	self renderSummaryOn: html.
	self renderFormOn: html.
	rows := self objectLogEntries reversed.
	filter notNil ifTrue: [
		| index |
		index := self labels indexOf: filter.
		rows := rows select: [:each | each priority = index].
	].
	report rows: rows.
	html render: report
]

{ #category : #rendering }
WAObjectLog >> renderFormOn: html [

	html form: [
		html div: [
			html label: 'Filter: '.
			html select
				list: self labels;
				beOptional;
				optionalLabel: '-- Show All --';
				selected: filter;
				callback: [:value | filter := value];
				yourself.
			html submitButton: 'Update'.
		].
	].
]

{ #category : #rendering }
WAObjectLog >> renderSummaryOn: html [

	summaryReport rows: self objectLogSummary.
	html render: summaryReport
]
