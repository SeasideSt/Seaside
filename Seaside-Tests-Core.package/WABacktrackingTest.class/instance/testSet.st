tests
testSet
	| original snapshot1 snapshot2 snapshot3 |

	original := Set with: 1 with: 2.
	snapshot1 := original snapshotCopy.

	original add: 3.
	snapshot2 := original snapshotCopy.

	original remove: 1.
	snapshot3 := original snapshotCopy.

	original restoreFromSnapshot: snapshot1.
	self assert: original size = 2.
	self assert: (original includes: 1).
	self assert: (original includes: 2).
	self deny: (original includes: 3).

	original restoreFromSnapshot: snapshot2.
	self assert: original size = 3.
	self assert: (original includes: 1).
	self assert: (original includes: 2).
	self assert: (original includes: 3).

	original restoreFromSnapshot: snapshot3.
	self assert: original size = 2.
	self deny: (original includes: 1).
	self assert: (original includes: 2).
	self assert: (original includes: 3).

	original add: 4.
	original restoreFromSnapshot: snapshot3.
	self assert: original size = 2.
	self deny: (original includes: 1).
	self assert: (original includes: 2).
	self assert: (original includes: 3).
	self deny: (original includes: 4)