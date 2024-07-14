rendering
renderContentOn: html

	| id |
	html listItem
		id: (id := html nextId);
		onDoubleClick: (html javascript turboCallback: [ self turboShow: (WATurboTodoItemEditor on: self) ]);
		with: [ 
			html div
				class: 'view';
				with:[
					self renderCheckBoxIn: id on: html.
					self renderDescriptionOn: html.
					self renderDestroyerOn: html ] ]