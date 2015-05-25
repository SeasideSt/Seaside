triggers
triggerInPlaceEditor: aBlock
	self callback: aBlock value: (JSStream argument: 1).
	self optionAt: 'callback' put: (JSFunction new
		add: (self options removeKey: 'parameters');
		return: true;
		yourself)