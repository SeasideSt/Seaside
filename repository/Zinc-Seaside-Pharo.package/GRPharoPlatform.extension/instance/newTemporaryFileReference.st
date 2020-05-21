*Zinc-Seaside-Pharo
newTemporaryFileReference
	"Create a new temporary file in the systems temp directory
	and answer a reference to it.
	It is the users responsibility to delete or move the file,
	it will not be cleaned up automatically (unless the host system
	has a policy for it)."
	^ FileLocator temp / UUID new asString