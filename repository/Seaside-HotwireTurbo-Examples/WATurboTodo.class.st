Class {
	#name : 'WATurboTodo',
	#superclass : 'WAExampleComponent',
	#instVars : [
		'todos'
	],
	#category : 'Seaside-HotwireTurbo-Examples',
	#package : 'Seaside-HotwireTurbo-Examples'
}

{ #category : 'testing' }
WATurboTodo class >> canBeRoot [ 
	^ true
]

{ #category : 'initialization' }
WATurboTodo class >> register [

	(WAAdmin register: self asApplicationAt: '/examples/turbo/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation
]

{ #category : 'actions' }
WATurboTodo >> addTodo: aString [

	| newTodo |
	newTodo := WATurboTodoItem newWithDescription: aString in: todos.
	newTodo addDecoration: WATurboFrame new.
	todos add: newTodo.
	^ newTodo
]

{ #category : 'accessing' }
WATurboTodo >> children [

	^ self todos
]

{ #category : 'initialization' }
WATurboTodo >> initialize [

	super initialize.
	todos := OrderedCollection new.
	1 to: 10 do: [ :index | 
		self addTodo: ('Task {1}' format: { index greaseString }) ]
]

{ #category : 'rendering' }
WATurboTodo >> renderAddNewTodoOn: html [

	| newTodo |
	html form
		id: 'new-todo-form';
		turboStreamCallback: [ :ts | 
			ts 
				append: 'todo-list' with: newTodo;
				replace: 'new-todo-form' with: [ :r | self renderAddNewTodoOn: r ] ];
		with: [
			html textInput
				id: 'new-todo';
				autofocus;
				noAutocomplete;
				callback: [ :value | newTodo := self addTodo: value ];
				placeholder: 'What needs to be done?' ]
]

{ #category : 'rendering' }
WATurboTodo >> renderContentOn: html [

	self renderTurboScriptOn: html.
	html section
		id: #todoapp;
		with: [
			self renderHeaderWithAddTodoOn: html.
			self renderTodosOn: html.
			self renderFooterOn: html ]
]

{ #category : 'rendering' }
WATurboTodo >> renderFooterOn: html [

	html footer
		id: #footer;
		with: [ 
			html span
				id: #'todo-count';
				with: todos size ]
]

{ #category : 'rendering' }
WATurboTodo >> renderHeaderWithAddTodoOn: html [

	html header
		id: #header;
		with: [
			html heading
				level: 1;
				with: 'todos'.
			self renderAddNewTodoOn: html ]
]

{ #category : 'rendering' }
WATurboTodo >> renderTodosOn: html [

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

{ #category : 'rendering' }
WATurboTodo >> renderTurboScriptOn: html [

	html script 
		type: 'module';
		"with:'import hotwiredTurbo from ''https://cdn.skypack.dev/@hotwired/turbo'';'"
		with: 'import * as Turbo from ''',(WATurboFileLibrary / #turboes2017esmJs) greaseString,''';'
]

{ #category : 'accessing' }
WATurboTodo >> todos [

	^ todos
]

{ #category : 'rendering' }
WATurboTodo >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'Seaside-Turbo Todo Demo'.
	aRoot stylesheet url: WAExamplesLibrary / #todoCss
]
