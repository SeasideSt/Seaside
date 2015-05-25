rendering-elements
renderTextAreaOn: html
	self
		renderLabel: 'Text-Area'
		control: [ :id :script |
			html textArea
				id: id;
				columns: 20;
				value: textArea;
				callback: [ :value | textArea := value ];
				onChange: (script html: [ :h | h render: textArea ]) ]
		model: textArea
		on: html