Class {
	#name : #WATableReportFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'report'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WATableReportFunctionalTest >> children [
	^ Array with: report
]

{ #category : #initialization }
WATableReportFunctionalTest >> initialize [
	super initialize.
	report := WATableReport new
		rows: WAComponent allSubclasses asArray;
		columns: (OrderedCollection new
			add: (WAReportColumn
				selector: #fullName title: 'Name'
				onClick: [ :each | self inform: each description onAnswer: [ ] ]);
			add: ((WAReportColumn
				selector: #canBeRoot title: 'Can Be Root')
				sortBlock: [ :a :b | a ]);
			add: (WAReportColumn
				renderBlock: [ :each :html | html emphasis: each description ]
				title: 'Description');
			yourself);
		rowColors: #(lightblue lightyellow);
		rowPeriod: 1;
		yourself
]
