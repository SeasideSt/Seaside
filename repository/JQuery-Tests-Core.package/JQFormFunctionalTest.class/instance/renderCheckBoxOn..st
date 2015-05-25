rendering-elements
renderCheckBoxOn: html
	self
		renderLabel: 'Check-Box'
		control: [ :id :script |
			html checkbox
				id: id;
				value: checkBox;
				callback: [ :value | checkBox := value ];
				onChange: (script html: [ :h | h render: checkBox ]) ]
		model: checkBox
		on: html