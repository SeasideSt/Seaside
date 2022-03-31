exporting
exportSortedTriplets: sortedTriplets

	| comment msgid |
	sortedTriplets do: [ :triplet | 
		comment := triplet second.
		msgid := triplet third.
		self exportRecordHeader: comment.
		self exportPhrase: msgid ]