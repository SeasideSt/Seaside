rendering-elements
renderSelectListOn: html
	self
		renderLabel: 'Select-List'
		control: [ :id :script |
			html select
				id: id;
				list: (1 to: 9);
				selected: selectList;
				callback: [ :value | selectList := value ];
				onChange: (script html: [ :h | h render: selectList ]) ]
		model: selectList
		on: html