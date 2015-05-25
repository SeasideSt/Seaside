tests
testHolder
	| original snapshot1 snapshot2 snapshot3 |
	original := WAValueHolder new.
	snapshot1 := original snapshotCopy.
	original contents: 1.
	snapshot2 := original snapshotCopy.
	original contents: 2.
	snapshot3 := original snapshotCopy.
	original restoreFromSnapshot: snapshot1.
	self assert: original contents isNil.
	original restoreFromSnapshot: snapshot2.
	self assert: original contents = 1.
	original restoreFromSnapshot: snapshot3.
	self assert: original contents = 2