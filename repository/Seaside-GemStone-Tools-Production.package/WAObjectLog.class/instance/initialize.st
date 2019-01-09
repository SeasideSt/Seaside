initialization
initialize
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