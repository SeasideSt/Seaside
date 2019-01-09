rendering
renderTodosOn: html
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

	