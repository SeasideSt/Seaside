delegation
call: aComponent onAnswer: aBlock
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. When #answer: is sent to aComponent, aBlock is evaluated. This can be used for continuation passing style programmation of a control flow. #call:onAnswer: does not block but
a WARenderNotification is immediately signaled, aborting the current callback or task processing."

	self == aComponent ifTrue: [ 
		WAError signal: 'You can not call self. You''re probably missing a return somewhere' ].
	self
		show: aComponent
		onAnswer: aBlock.
	WARenderNotification signal