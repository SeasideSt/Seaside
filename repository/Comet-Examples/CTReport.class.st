Class {
	#name : #CTReport,
	#superclass : #WAComponent,
	#classInstVars : [
		'items',
		'pusher'
	],
	#category : 'Comet-Examples'
}

{ #category : #private }
CTReport class >> defaultModel [
	^ OrderedCollection new
		add: (CTReportItem new
			name: 'Peter Parker';
			phone: '183 045 2037';
			yourself);
		add: (CTReportItem new
			name: 'John Hood';
			phone: '602 979 3001';
			yourself);
		add: (CTReportItem new
			name: 'Clark Kent';
			phone: '497 776 2568';
			yourself);
		add: (CTReportItem new
			name: 'Bruce Evans';
			phone: '167 604 1282';
			yourself);
		yourself
]

{ #category : #initialization }
CTReport class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'comet/report'.
	application
		addLibrary: JQDevelopmentLibrary;
		addLibrary: CTLibrary
]

{ #category : #accessing }
CTReport class >> items [
	^ items ifNil: [ items := self defaultModel ]
]

{ #category : #accessing }
CTReport class >> pusher [
	^ pusher ifNil: [ pusher := CTPusher new ]
]

{ #category : #accessing }
CTReport >> items [
	^ self class items
]

{ #category : #accessing }
CTReport >> pusher [
	^ self class pusher
]

{ #category : #rendering }
CTReport >> renderAddOn: html [
	html anchor
		url: '#';
		" append a new row to the table "
		onClick: (html jQuery ajax script: [ :script |
			script add: ((script jQuery: 'table') append: [ :renderer |
				renderer tableRow: [
					self
						renderRowEdit: CTReportItem new
						action: [ :item | self items add: item ]
						on: renderer ] ]) ]);
		with: 'Add Item'
]

{ #category : #rendering }
CTReport >> renderContentOn: html [
	html table
		script: (html jQuery this
			bind: 'refresh' do: (html jQuery this load
				html: [ :h | self renderTableOn: h ]));
		with: [ self renderTableOn: html ].
	html paragraph: [
		self renderAddOn: html ].
	html document 
		addLoadScript: (html comet
			pusher: self pusher;
			connect)
]

{ #category : #rendering }
CTReport >> renderRowEdit: anItem action: aBlock on: html [
	html tableData: [ 
		html textInput
			" focus the first input field "
			script: (html jQuery this triggerFocus);
			on: #name of: anItem ].
	html tableData: [ 
		html textInput 
			on: #phone of: anItem ].
	html tableData: [
		html anchor
			url: '#';
			onClick: (html jQuery ajax
				" serialize all form elements in the table "
				serialize: ((html jQuery this closest: 'table') find: ':input');
				" trigger a refresh on all connected tables "
				html: [ :r |
					aBlock value: anItem.
					self pusher javascript: [ :s |
						s add: ((s jQuery: 'table') 
							trigger: 'refresh') ] ]);
			with: 'save' ]
]

{ #category : #rendering }
CTReport >> renderRowEdit: anItem on: html [
	self renderRowEdit: anItem action: [ :item | ] on: html
]

{ #category : #rendering }
CTReport >> renderRowView: anItem on: html [
	html tableData: anItem name.
	html tableData: anItem phone.
	html tableData: [
		html anchor
			url: '#';
			" replace the owning row with an editable row "
			onClick: ((html jQuery this closest: 'tr') load
				html: [ :r | self renderRowEdit: anItem on: r ]);
			with: 'edit' ]
]

{ #category : #rendering }
CTReport >> renderTableOn: html [
	html tableRow: [
		html tableHeading: 'Name'.
		html tableHeading: 'Phone'.
		html tableHeading ].
	self items do: [ :each |
		html tableRow: [
			self renderRowView: each on: html ] ]
]
