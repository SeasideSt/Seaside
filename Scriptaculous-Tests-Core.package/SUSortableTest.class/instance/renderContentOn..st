rendering
renderContentOn: html
	| id |
	html unorderedList
		id: (id := html nextId);
		script: (html scriptaculous sortable
			onUpdate: (html scriptaculous request
				triggerSortable: id
				callback: [ :value | collection := value ]));
		with: [ self renderListItemsOn: html ]