delegation
show: aComponent
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. As opposed to #call: sending this message does not block and immediately returns."

	self
		show: aComponent
		onAnswer: [ :value | ]