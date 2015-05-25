scripting
triggerFormOn: html
	^ html prototype evaluator
		triggerForm: self timeId;
		callback: [ :script | self scriptSelect: self date on: script ];
		return: false