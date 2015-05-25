options
asynchronous: aBoolean
	"Determines whether XMLHttpRequest is used asynchronously or not. Since synchronous usage is rather unsettling, and usually bad taste, you should avoid changing this. Seriously."

	self optionAt: 'asynchronous' put: aBoolean