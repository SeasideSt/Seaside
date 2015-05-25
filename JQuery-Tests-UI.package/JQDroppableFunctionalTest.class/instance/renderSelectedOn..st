rendering
renderSelectedOn: html
	html div
		class: 'selected ui-corner-all'; 
		script: (html jQuery new droppable
			onDrop: (html jQuery this load
				callbackDroppable: [ :event | self selected add: (event at: #draggable) ];
				html: [ :r | self renderSelectedItemsOn: r ]));
		with: [ self renderSelectedItemsOn: html ]