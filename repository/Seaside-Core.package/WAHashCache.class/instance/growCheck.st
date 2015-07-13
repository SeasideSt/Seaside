private
growCheck
	size > (keyTable size * self loadFactor) ifTrue: [
		"rehash for fun"
		| newKeyTable newValueTable newTableSize |
		newTableSize := WAHashTableSizes atLeast: keyTable size * 2.
		newKeyTable := Array new: newTableSize.
		newValueTable := Array new: newTableSize.
		
		"rehash keys"
		keyTable do: [ :each |
			| next current |
			current := each.
			[ current isNil ] whileFalse: [
				| index atTargetIndex |
				next := current next.
				index := (current keyHash \\ newTableSize) + 1.
				atTargetIndex := newKeyTable at: index.
				atTargetIndex isNil
					ifTrue: [ newKeyTable at: index put: current ]
					ifFalse: [
						[ atTargetIndex next isNil ] whileFalse: [
							atTargetIndex := atTargetIndex next ].
						atTargetIndex next: current ].
				current next: nil.
				current := next ] ].
		
		"rehash values"
		valueTable do: [ :each |
			| next current |
			current := each.
			[ current isNil ] whileFalse: [
				| index atTargetIndex |
				next := current next.
				index := (current valueHash \\ newTableSize) + 1.
				atTargetIndex := newValueTable at: index.
				atTargetIndex isNil
					ifTrue: [ newValueTable at: index put: current ]
					ifFalse: [
						[ atTargetIndex next isNil ] whileFalse: [
							atTargetIndex := atTargetIndex next ].
						atTargetIndex next: current ].
				current next: nil.
				current := next ] ].
		keyTable := newKeyTable.
		valueTable := newValueTable ]