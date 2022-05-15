exporting
createAndSortTriplets: translationLiterals

| msgid sortedMethods category sortKey comment commentUnderLined triplets |
triplets := translationLiterals associations
				collect: [:assoc | 
					msgid := assoc key.
					sortedMethods := assoc value asArray sort.
					category := (Smalltalk at: sortedMethods first instanceSideParentName) category asString.
					sortKey := category , ',' , sortedMethods first printString , ',' , msgid.
					comment := (sortedMethods
								collect: [:each | each actualClass asString , '>>' , each selector asString])
								inject: category
								into: [:result :methodName | result , ',' , methodName].
					"Replace white spaces to := because gettext tool might
					replace a space to a new line some times, and it makes
					difficult to take a diff."
					commentUnderLined := comment copyReplaceAll: ' ' with: ':='.
					Array
						with: sortKey
						with: commentUnderLined
						with: msgid].

^ triplets sort: [ :a :b | a first <= b first ].