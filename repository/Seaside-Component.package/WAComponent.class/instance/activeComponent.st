convenience
activeComponent
	"Answer the visible component, this might be a different component being delegated to or the receiver itself."
	
	self visiblePresentersDo: [ :each | each isDecoration ifFalse: [ ^ each ] ]