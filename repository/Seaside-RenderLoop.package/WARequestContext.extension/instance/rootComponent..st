*seaside-renderloop
rootComponent: aComponent
	"Set the root component for the render loop.
	If this message is sent before a session is created the given component will be used as the root component of the render loop instead of the root component configured on the application."
	self properties at: #rootComponent put: aComponent