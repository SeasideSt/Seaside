actions
dontDestroy
	"Prevent any objects from being released.
	For debug purposes"
	self properties at: #shouldDestroy put: false