initialization
initialize
	"We don't want to include our own data in the mix.
	Process is excluded because otherwise our Semaphores pull them in and the Process is
	obviously not held onto by the Semaphore indefinitely.
	CompiledMethods are basically always going to be around in the image anyway so are
	not really session-specific data."
	IgnoredClasses := Array with: WAMemory with: WAMemoryItem with: Process with: CompiledMethod