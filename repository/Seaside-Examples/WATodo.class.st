"
I am the TODO application example's root component
"
Class {
	#name : 'WATodo',
	#superclass : 'WAExampleComponent',
	#instVars : [
		'todos'
	],
	#category : 'Seaside-Examples-Misc',
	#package : 'Seaside-Examples',
	#tag : 'Misc'
}

{ #category : 'initialization' }
WATodo class >> initialize [
	(WAAdmin register: self asApplicationAt: '/examples/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary
]

{ #category : 'adding' }
WATodo >> addTodo: aString [
	| newTodo |
	newTodo := WATodoItem newWithDescription: aString in: todos.
	todos add: newTodo.
	^ newTodo
]

{ #category : 'hooks' }
WATodo >> children [
	^ self todos
]

{ #category : 'initialization' }
WATodo >> initialize [
	super initialize.
	todos := OrderedCollection new.
	1 to: 10 do: [ :index | 
		self addTodo: ('Task {1}' format: { index greaseString }) ]
]

{ #category : 'rendering' }
WATodo >> renderAddNewTodoOn: html [
	| newTodo |
	html header
		id: #header;
		with: [
			html form: [
				html heading
					level: 1;
					with: 'todos'.
				html textInput
					id: #'new-todo';
					autofocus;
					attributeAt: 'autocomplete' put: 'off';
					callback: [ :value | newTodo := self addTodo: value ];
					placeholder: 'What needs to be done?' ] ]
]

{ #category : 'rendering' }
WATodo >> renderContentOn: html [
	html section
		id: #todoapp;
		with: [
			self renderAddNewTodoOn: html.
			self renderTodosOn: html ]
]

{ #category : 'rendering' }
WATodo >> renderTodosOn: html [

	html section
		id: 'main';
		with: [
			html checkbox
				id: 'toggle-all'.
			html  label 
				for: 'toggle-all';
				with: 'Mark all as complete'.
			html unorderedList
				id: 'todo-list';
				with: [ self todos do: [ :todoItem | todoItem renderOn: html ] ] ]
]

{ #category : 'accessing' }
WATodo >> todos [
	^ todos
]

{ #category : 'updating' }
WATodo >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'Seaside Todo Demo'.
	aRoot stylesheet url: WAExamplesLibrary / #todoCss
]
