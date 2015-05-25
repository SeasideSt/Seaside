scripting
closeOn: script
	self close.
	script prototype element
		id: self componentId;
		remove.
	script scriptaculous effect
		id: self windowId;
		duration: 0.5; fade