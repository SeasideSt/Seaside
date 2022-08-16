private
socketsDo: aOneArgumentBlock
	mutex critical: [
		sockets do: aOneArgumentBlock ]