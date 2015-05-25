private
newHandler
	^ WAApplication new
		preferenceAt: #charSet put: 'utf-16';
		yourself