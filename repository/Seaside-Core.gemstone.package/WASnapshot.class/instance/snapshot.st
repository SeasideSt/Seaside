actions
snapshot
	"Snapshot all the states that have been registered for backtracking overriding existing snapshots."

	objects associationsDo: [ :assoc | assoc value: assoc key snapshotCopy ]