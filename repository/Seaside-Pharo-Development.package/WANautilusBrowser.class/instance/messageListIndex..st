accessing
messageListIndex: anInteger
	nautilus selectedMethod: self selectedClass >> (self messageList at: anInteger).
	self changed: #messageListIndex