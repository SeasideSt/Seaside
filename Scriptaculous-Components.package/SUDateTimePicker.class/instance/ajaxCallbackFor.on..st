scripting
ajaxCallbackFor: aDate on: html
	^ html prototype evaluator
		callback: [ :script | 
			self select: aDate.
			self scriptUpdateOn: script ];
		return: false