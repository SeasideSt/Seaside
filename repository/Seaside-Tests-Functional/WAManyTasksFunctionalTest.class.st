Class {
	#name : #WAManyTasksFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'tasks',
		'selection'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WAManyTasksFunctionalTest >> addTask [
	selection contents notNil ifTrue: [ tasks add: selection contents new ]
]

{ #category : #hooks }
WAManyTasksFunctionalTest >> children [
	^ tasks
]

{ #category : #initialization }
WAManyTasksFunctionalTest >> initialize [
	super initialize.
	tasks := OrderedCollection new.
	selection := WAValueHolder new.
	tasks add: WADelegationTask new
]

{ #category : #rendering }
WAManyTasksFunctionalTest >> renderContentOn: html [
	html form: [ 
		html div: [
			html paragraph: 'Adding WAEmptyTestTask is expected to cause an infinite recursion and should raise an exception.'.
			html select
				list: (self taskClasses asSortedCollection: [ :a :b | a name <= b name ]);
				on: #contents of: selection.
			html submitButton
				callback: [ self addTask ];
				with: 'Add'.
			html submitButton
				callback: [ self showTask ];
				with: 'Show' ] ].
	self renderTasksOn: html
]

{ #category : #rendering }
WAManyTasksFunctionalTest >> renderTasksOn: html [
	tasks do: [ :each |
		html div: [
			html div: each.
			html anchor
				callback: [ tasks remove: each ];
				with: '(remove task)' ] ]
]

{ #category : #actions }
WAManyTasksFunctionalTest >> showTask [
	selection contents notNil ifTrue: [ self show: selection contents new ]
]

{ #category : #hooks }
WAManyTasksFunctionalTest >> states [
	^ Array with: tasks
]

{ #category : #accessing }
WAManyTasksFunctionalTest >> taskClasses [
	^ WATask allSubclasses select: [ :each | each subclasses isEmpty ]
]
