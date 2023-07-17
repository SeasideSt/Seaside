exporting
createAndSortTriplets: translationLiterals

	| msgid sortedMethods sortKey comment commentUnderLined triplets |
	triplets := translationLiterals associations collect: [ :assoc |
		            msgid := assoc key.
		            sortedMethods := assoc value asArray sort.
		            sortKey := sortedMethods first printString , ',', msgid.
		            comment := String streamContents:[ :str | 
										sortedMethods 
											do: [ :each | str nextPutAll: each actualClass asString ; nextPutAll: '>>'; nextPutAll: each selector asString ]
			                       	separatedBy: [ str nextPut: $, ] ].
		            "Replace white spaces to := because gettext tool might replace a space to a new line some times, and it makes difficult to take a diff."
		            commentUnderLined := comment copyReplaceAll: ' ' with: ':='.
		            Array with: sortKey with: commentUnderLined with: msgid ].

	^ triplets sort: [ :a :b | a first <= b first ]