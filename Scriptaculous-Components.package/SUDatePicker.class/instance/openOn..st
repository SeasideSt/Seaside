scripting
openOn: aScript 
	| anElement |
	anElement := aScript prototype element id: containerId.
	anElement	
		absolutize;
		styleAt: 'left'
			put: origin x greaseString , 'px';
		styleAt: 'top'
			put: origin y greaseString , 'px'.
	self isOpen
		ifFalse: [
			anElement update: self.
			open := true ]