rendering-elements
renderSelectListOn: html
	self
		renderLabel: 'Select-List'
		control: [ :fid :mid |
			html select
				list: (1 to: 9);
				selected: selectList;
				callback: [ :value | selectList := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: selectList ]) ]
		model: selectList
		on: html