rendering-elements
renderCheckBoxOn: html
	self
		renderLabel: 'Check-Box'
		control: [ :fid :mid |
			html checkbox
				value: checkBox;
				callback: [ :value | checkBox := value ];
				onClick: (html scriptaculous updater
					id: mid;
					triggerForm: fid;
					callback: [ :r | r render: checkBox ]) ]
		model: checkBox
		on: html