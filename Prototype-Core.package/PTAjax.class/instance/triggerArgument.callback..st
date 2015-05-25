triggers
triggerArgument: anInteger callback: aBlock
	"Triggers a JavaScript function argument and passes its value into aBlock."

	self callback: aBlock value: (JSStream argument: anInteger)