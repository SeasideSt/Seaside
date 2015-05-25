rendering-elements
renderTextInputOn: html
	self
		renderLabel: 'Text-Input'
		control: [ :id :script |
			html textInput
				id: id;
				value: textInput;
				callback: [ :value | textInput := value ];
				onChange: (script html: [ :h | h render: textInput ]).
			"the following code checks if a manual submit does a correct encoding:"
			html submitButton
				onClick: (html jQuery ajax
					callback: [ :value | textInput := value ] value: (html jQuery id: id) value;
					script: [ :s | s alert: 'The submitted value is: "' , textInput , '".' ]);
				with: 'Manual Submit' ]
		model: textInput
		on: html