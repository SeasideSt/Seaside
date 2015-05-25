tests
testOrderedCollection
	| original snapshot |

	original := OrderedCollection with: 1 with: 2.
	snapshot := original snapshotCopy.
	
	original restoreFromSnapshot: snapshot.
	self assert: original asArray = #(1 2).
	
	original removeLast.
	
	original restoreFromSnapshot: snapshot.
	self assert: original asArray = #(1 2)