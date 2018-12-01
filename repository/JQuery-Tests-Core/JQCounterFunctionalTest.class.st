Class {
	#name : #JQCounterFunctionalTest,
	#superclass : #JQFunctionalTest,
	#instVars : [
		'count'
	],
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #initialization }
JQCounterFunctionalTest >> initialize [
	super initialize.
	count := 0
]

{ #category : #rendering }
JQCounterFunctionalTest >> renderContentOn: html [
	html paragraph: [
		html anchor
			url: 'javascript:void(0)';
			onClick: ((html jQuery: #count) load
				html: [ :h | h render: (count := count - 1) ]);
			with: '--'.
		html span
			id: #count;
			with: count.
		html anchor
			url: 'javascript:void(0)';
			onClick: ((html jQuery: #count) load
				html: [ :h | h render: (count := count + 1) ]);
			with: '++' ]
]

{ #category : #accessing }
JQCounterFunctionalTest >> selectors [
	^ #(initialize renderContentOn:)
]

{ #category : #hooks }
JQCounterFunctionalTest >> style [
	^ '#count { margin: 0 0.5em; }'
]

{ #category : #accessing }
JQCounterFunctionalTest >> title [
	^ 'Counting Up and Down'
]
