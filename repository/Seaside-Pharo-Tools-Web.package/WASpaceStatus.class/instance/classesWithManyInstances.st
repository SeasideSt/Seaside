private
classesWithManyInstances
	^ Array streamContents: [ :stream |
		Smalltalk globals keysAndValuesDo: [ :key :value |
			((value isKindOf: Class) and: [ key == value name ]) ifTrue: [
				| class |
				class := Smalltalk globals at: key.
				(self shouldConsider: class) ifTrue: [
					stream nextPut: class ] ] ] ]