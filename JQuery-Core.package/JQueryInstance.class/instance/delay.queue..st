effects
delay: aDuration queue: aString
	"Set a timer to delay execution of subsequent items in the queue."
	
	self call: 'delay' with: aDuration with: aString