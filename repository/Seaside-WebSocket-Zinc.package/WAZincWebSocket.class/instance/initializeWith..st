initialization
initializeWith: aZnWebSocket

	self initialize.
	onClose := [ Transcript show: 'closing...' ].
	znWebSocket := aZnWebSocket