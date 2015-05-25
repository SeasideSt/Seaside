delegation
show: aComponent onAnswer: aBlock
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. When #answer: is sent to aComponent, aBlock is evaluated. This can be used for continuation passing style programmation of a control flow. #show:onAnswer: does not block."

	self
		show: aComponent
		onAnswer: aBlock
		delegation: (WADelegation new
			delegate: aComponent;
			yourself)