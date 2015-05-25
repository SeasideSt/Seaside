rendering-elements
renderTextAreaOn: html
	self
		renderLabel: 'Text-Area'
		control: [ :fid :mid |
			html textArea columns: 20;
				value: textArea;
				callback: [ :value | textArea := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: textArea ]) ]
		model: textArea
		on: html