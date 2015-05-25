private
push: aString with: aBlock
	"This code pushes the new message to all its clients. With the exception of part 2 adding the message itself, all other parts are optional."
	
	self pusher javascript: [ :script |
		script add: ((script jQuery: #messages)
		"1. limit listing to 20 messages"
			children;
			sliceFrom: 0 to: -19;
			remove;
			end;
		"2. append message to bottom"
			append: [ :html | self renderMessage: aBlock class: aString on: html ];
			end;
		"3. scroll to bottom"
			scrollTop: 65536) ]