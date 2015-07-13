private
findEntryOrNilWithKey: aKey hash: anHashInteger index: anIndexInteger
	| entry |
	entry := keyTable at: anIndexInteger.
	[ entry isNil ] whileFalse: [
		(entry keyHash = anHashInteger and: [ entry key = aKey ])
			ifTrue: [
				| byAccessListEntry |
				byAccessListEntry := entry byAccessListEntry.
				self expunge: byAccessListEntry.
				self addToAccessEnd: byAccessListEntry.
				^ entry ]
			ifFalse: [ entry := entry next ] ].
	^ nil