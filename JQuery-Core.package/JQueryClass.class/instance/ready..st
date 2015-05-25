creation
ready: anObject
	"Binds a function to be executed whenever the DOM is ready to be traversed and manipulated. Note: Do not combine the jQuery ready-function and the Seaside mechanism (WAHtmlDocument>>#addLoadScript:) to add load-scripts. The queues of these two mechanisms are independent and conflict with each other. The execution order of the scripts is undefined. Preferably use the mechanism of Seaside: it transfers less bytes over the network and reliably works for full requests and AJAX callbacks."

	^ self expression: anObject asFunction