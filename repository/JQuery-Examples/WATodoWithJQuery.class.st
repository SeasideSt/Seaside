Class {
	#name : 'WATodoWithJQuery',
	#superclass : 'WAExampleComponent',
	#instVars : [
		'todos'
	],
	#category : 'JQuery-Examples',
	#package : 'JQuery-Examples'
}

{ #category : 'initialization' }
WATodoWithJQuery class >> initialize [
	 (WAAdmin register: self asApplicationAt: '/examples/todo-jquery')
		exceptionHandler: WADebugErrorHandler;
		addLibrary: WAExamplesLibrary
]

{ #category : 'actions' }
WATodoWithJQuery >> addTodo: aString [
	| newTodo |
	newTodo := WATodoWithJQueryItem newWithDescription: aString in: todos.
	todos add: newTodo.
	^ newTodo
]

{ #category : 'accessing' }
WATodoWithJQuery >> children [
	^ self todos
]

{ #category : 'initialization' }
WATodoWithJQuery >> initialize [
	super initialize.
	todos := OrderedCollection new.
	1 to: 5000 do: [ :index | 
		self addTodo: 'Task ', index greaseString ]
]

{ #category : 'rendering' }
WATodoWithJQuery >> renderAddNewTodoOn: html [
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
				onChange: (html jQuery ajax 
								serializeThis;
								script: [ :s | s << ((s jQuery id: 'todo-list') append: newTodo) ];
								onComplete: ((html jQuery id: #'new-todo') value: ''));
				placeholder: 'What needs to be done?' ]
]

{ #category : 'rendering' }
WATodoWithJQuery >> renderContentOn: html [
	html section
		id: #todoapp;
		with: [
			self renderAddNewTodoOn: html.
			self renderTodosOn: html ]
]

{ #category : 'rendering' }
WATodoWithJQuery >> renderTodosOn: html [

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
				script: (self scriptToTriggerCheckboxToggleOn: html);
				script: (self scriptToTriggerRenameOn: html);
				script: (self scriptToTriggerEditOn: html);
				script: (self scriptToSerializeEditOn: html);
				with: [ 
					self todos do: [ :todoItem | todoItem renderOn: html ] ] ]
]

{ #category : 'rendering' }
WATodoWithJQuery >> scriptToSerializeEditOn: html [

	| currentItem itemId |
	^ html jQuery this
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
				asFunction: #(event))
]

{ #category : 'rendering' }
WATodoWithJQuery >> scriptToTriggerCheckboxToggleOn: html [

	^ html jQuery this 
		on: 'click' 
		selector: '.toggle' 
		do: ((html jQuery ajax serializeWithHidden: (html jQuery expression: (JSStream on: 'event.target'))) asFunction: #(event))
]

{ #category : 'rendering' }
WATodoWithJQuery >> scriptToTriggerEditOn: html [

	^ html jQuery this
			on: 'click'
			selector: '.view>label'
			do: (((((html jQuery expression: (JSStream on: 'event.target')) hide closest:'li') find: '.edit') show) asFunction:#(event))
]

{ #category : 'rendering' }
WATodoWithJQuery >> scriptToTriggerRenameOn: html [

	^ html jQuery this 
			on: 'click' 
			selector: '.destroy' 
			do: ((html jQuery ajax 
						callback: [ :passengers | passengers first remove ]
						passengers: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li'));
						onComplete: (((html jQuery expression: (JSStream on:'event.target')) closest: 'li') remove)) asFunction: #(event))
]

{ #category : 'accessing' }
WATodoWithJQuery >> todos [
	^ todos
]

{ #category : 'rendering' }
WATodoWithJQuery >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot title: 'Seaside-JQuery Todo Demo'.
	aRoot stylesheet url: WAExamplesLibrary / #todoCss.
	aRoot javascript url: JQDeploymentLibrary / #jQueryJs
]
