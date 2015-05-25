rendering
renderRowEdit: anItem action: aBlock on: html
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