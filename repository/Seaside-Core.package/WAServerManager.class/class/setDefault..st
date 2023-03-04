configuring
setDefault: aWAServerManager
	"Private - Sets aWAServerManager as the default instance of receiver."

	self ensureDefaultValueHolder.
	Default contents: aWAServerManager.