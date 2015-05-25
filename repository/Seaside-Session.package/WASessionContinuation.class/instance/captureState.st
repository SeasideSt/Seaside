processing
captureState
	"self states reset"
	"Setting states to nil matches the behaviour of Seaside 2.8. Resetting the Snapshot
	is useful for JS callbacks in that refreshing the page will show the modified state
	but can also result in many ActionPhaseContinuations all sharing the same state
	but with different callbacks, some of which may reference state that is no longer present."
	states := nil.
	self updateStates: self states