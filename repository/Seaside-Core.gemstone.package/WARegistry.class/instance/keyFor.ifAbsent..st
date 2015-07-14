parent/child
keyFor: aRequestHandler ifAbsent: absentBlock
	^ self cache keyAtValue: aRequestHandler ifAbsent: absentBlock