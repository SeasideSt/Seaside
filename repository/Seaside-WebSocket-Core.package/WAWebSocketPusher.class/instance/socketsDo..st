protected
socketsDo: aOneArgumentBlock
	self mutex critical: [
		sockets do: aOneArgumentBlock ]