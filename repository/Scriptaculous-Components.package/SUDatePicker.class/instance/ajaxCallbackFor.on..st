scripting
ajaxCallbackFor: aDate on: html
	^ html prototype evaluator
		callback: [ :script | self scriptSelect: aDate on: script ];
		return: false