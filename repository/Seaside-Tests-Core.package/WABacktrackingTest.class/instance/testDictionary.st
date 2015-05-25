tests
testDictionary
	| original snapshot1 snapshot2 snapshot3 snapshot4 |

	original := Dictionary new.
	original at: 1 put: #a; at: 2 put: #b.
	snapshot1 := original snapshotCopy.

	original at: 3 put: #c.
	snapshot2 := original snapshotCopy.

	original at: 3 put: #d.
	snapshot3 := original snapshotCopy.

	original removeKey: 1.
	snapshot4 := original snapshotCopy.

	original restoreFromSnapshot: snapshot1.
	self assert: original size = 2.
	self assert: (original at: 1 ifAbsent: [ ]) = #a.
	self assert: (original at: 2 ifAbsent: [ ]) = #b.
	self assert: (original at: 3 ifAbsent: [ ]) isNil.
	self assert: (original at: 4 ifAbsent: [ ]) isNil.

	original restoreFromSnapshot: snapshot2.
	self assert: (original at: 1 ifAbsent: [ ]) = #a.
	self assert: (original at: 2 ifAbsent: [ ]) = #b.
	self assert: (original at: 3 ifAbsent: [ ]) = #c.
	self assert: (original at: 4 ifAbsent: [ ]) isNil.

	original restoreFromSnapshot: snapshot3.
	self assert: (original at: 1 ifAbsent: [ ]) = #a.
	self assert: (original at: 2 ifAbsent: [ ]) = #b.
	self assert: (original at: 3 ifAbsent: [ ]) = #d.
	self assert: (original at: 4 ifAbsent: [ ]) isNil.

	original restoreFromSnapshot: snapshot4.
	self assert: (original at: 1 ifAbsent: [ ]) isNil.
	self assert: (original at: 2 ifAbsent: [ ]) = #b.
	self assert: (original at: 3 ifAbsent: [ ]) = #d.
	self assert: (original at: 4 ifAbsent: [ ]) isNil.

	original at: 2 put: #!.
	original restoreFromSnapshot: snapshot4.
	self assert: (original at: 1 ifAbsent: [ ]) isNil.
	self assert: (original at: 2 ifAbsent: [ ]) = #b.
	self assert: (original at: 3 ifAbsent: [ ]) = #d.
	self assert: (original at: 4 ifAbsent: [ ]) isNil