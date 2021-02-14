Class {
	#name : #WADeprecation,
	#superclass : #WATool,
	#instVars : [
		'table',
		'filter'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'instance creation' }
WADeprecation class >> on: filter [
	^ self new
		filter: filter;
		yourself
]

{ #category : #private }
WADeprecation >> buildTable [
	^ WATableReport new
		rowPeriod: 1;
		rowColors: #( '#eee' 'white' );
		rows: self notifications;
		columns: (Array
			with: (WAReportColumn selector: #messageText title: 'Deprecated')
			with: (WAReportColumn selector: #details title: 'Details'));
		yourself
]

{ #category : #hooks }
WADeprecation >> children [
	^ Array with: self table
]

{ #category : #accessing }
WADeprecation >> filter: aFilter [
	filter := aFilter
]

{ #category : #accessing }
WADeprecation >> notifications [
	^ filter notifications
]

{ #category : #rendering }
WADeprecation >> renderContentOn: html [
	html div
		class: 'tool';
		with: [
			html render: self table.
			html anchor
				callback: [ self resetDeprecationWarnings ];
				with: 'Reset deprecation warnings' ]
	
]

{ #category : #actions }
WADeprecation >> resetDeprecationWarnings [
	filter reset.
	self answer
]

{ #category : #accessing }
WADeprecation >> table [
	^ table ifNil: [ table := self buildTable ]
]
