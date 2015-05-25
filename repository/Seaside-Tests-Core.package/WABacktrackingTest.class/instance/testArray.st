tests
testArray
	| original snapshot1 snapshot2 snapshot3 |

	original := Array with: 1 with: 2 with: 3.
	snapshot1 := original snapshotCopy.

	original at: 1 put: #a.
	snapshot2 := original snapshotCopy.

	original at: 2 put: #b.
	snapshot3 := original snapshotCopy.

	original restoreFromSnapshot: snapshot1.
	self assert: original = #( 1 2 3 ).

	original restoreFromSnapshot: snapshot2.
	self assert: original = #( a 2 3 ).

	original restoreFromSnapshot: snapshot3.
	self assert: original = #( a b 3 )