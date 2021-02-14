Class {
	#name : #WATodo,
	#superclass : #WAExampleComponent,
	#instVars : [
		'todos'
	],
	#category : 'Seaside-Examples-Misc'
}

{ #category : #initialization }
WATodo class >> initialize [
	(WAAdmin register: self asApplicationAt: '/examples/todo')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary
]

{ #category : #actions }
WATodo >> addTodo: aString [
	| newTodo |
	newTodo := WATodoItem newWithDescription: aString in: todos.
	todos add: newTodo.
	^ newTodo
]

{ #category : #accessing }
WATodo >> children [
	^ self todos
]

{ #category : #initialization }
WATodo >> initialize [
	super initialize.
	todos := OrderedCollection new.
	1 to: 5000 do: [ :index | 
		self addTodo: 'Task ', index greaseString ]
]

{ #category : #rendering }
WATodo >> renderAddNewTodoOn: html [
	| newTodo |
	html header
		id: #header;
		with: [
			html heading
				level: 1;
				with: 'todos'.
			html textInput
				id: #'new-todo';
				autofocus;
				attributeAt: 'autocomplete' put: 'off';
				callback: [ :value | newTodo := self addTodo: value ];
				"onChange: (html jQuery ajax 
								serializeThis;
								onComplete: ((html jQuery ajax script: [:s | s << ((s jQuery id: 'todo-list') append: newTodo)]),
											   ((html jQuery id: #'new-todo') value: '')));"
				onChange: (html jQuery ajax 
								serializeThis;
								script: [ :s | s << ((s jQuery id: 'todo-list') append: newTodo) ];
								onComplete: ((html jQuery id: #'new-todo') value: ''));
				placeholder: 'What needs to be done?' ]
]

{ #category : #rendering }
WATodo >> renderContentOn: html [
	html section
		id: #todoapp;
		with: [
			self renderAddNewTodoOn: html.
			self renderTodosOn: html.
			self renderFooterOn: html ]
]

{ #category : #rendering }
WATodo >> renderFooterOn: html [
	
	
]

{ #category : #rendering }
WATodo >> renderTodosOn: html [
	| currentItem itemId | 
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
				script: (html jQuery this 
									on: 'click' 
									selector: '.toggle' 
									do: ((html jQuery ajax serializeWithHidden: (html jQuery expression: (JSStream on: 'event.target'))) asFunction: #(event)));
				script: (html jQuery this 
									on: 'click' 
									selector: '.destroy' 
									do: ((html jQuery ajax 
													callback: [ :passengers | passengers first remove ]
													passengers: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li'));
													onComplete: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li') remove)) asFunction: #(event)));
				script: (html jQuery this
							on: 'click'
							selector: '.view>label'
							do: (((((html jQuery expression: (JSStream on: 'event.target')) hide closest:'li') find: '.edit') show) asFunction:#(event)));
				script: (html jQuery this
								on: 'change'
								selector:'.edit'
								do: ((
									html jQuery ajax
										serialize: (html jQuery expression: (JSStream on:'event.target'));
										callback: [ :passengers | currentItem := passengers first ]
										passengers: ((html jQuery expression: (JSStream on:'event.target')) closest:'li');
										callback: [ :id | itemId := id ]
										value: (JSStream on:'$(event.target).closest("li").get(0).id');
										script: [ :s |  s << (((s jQuery id: itemId) find: 'label') html: currentItem description) ];
										onComplete: ((((html jQuery expression: (JSStream on: 'event.target')) closest:'li') find: '.edit') hide, (((html jQuery expression: (JSStream on: 'event.target')) closest:'li') find: 'label') show))
								 asFunction: #(event)));
				with: [ self todos do: [ :todoItem | todoItem renderOn: html ] ] ]

	
]

{ #category : #accessing }
WATodo >> todos [
	^ todos
]

{ #category : #rendering }
WATodo >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot stylesheet url: WAExamplesLibrary / #todoCss.
	aRoot javascript url: JQDeploymentLibrary / #jQueryJs
]
