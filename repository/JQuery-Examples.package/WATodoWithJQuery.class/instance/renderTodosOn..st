rendering
renderTodosOn: html

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