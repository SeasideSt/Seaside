rendering
renderContentOn: html
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