callbacks
callback: aBlock
	"Only called if a file was selected."
	self name: (self storeCallback: (WAUploadExternalFileCallback on: aBlock))