rendering-elements
renderMultiSelectListOn: html 
	self 
		renderLabel: 'Multi-Select-List'
		control: [ :id :script | 
			html multiSelect
				id: id;
				size: 3;
				list: (1 to: 9);
				selected: multiSelectList;
				callback: [ :value | multiSelectList := value ];
				onChange: (script html: [ :h | h render: multiSelectList ]) ]
		model: multiSelectList
		on: html