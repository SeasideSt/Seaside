rendering-elements
renderTextInputOn: html
	self
		renderLabel: 'Text-Input'
		control: [ :fid :mid |
			html textInput
				value: textInput;
				callback: [ :value | textInput := value ];
				onChange: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: textInput ]) ]
		model: textInput
		on: html