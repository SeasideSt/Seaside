tests
testObject
	| original snapshot |

	original := Object new.
	snapshot := original snapshotCopy.
	original restoreFromSnapshot: snapshot