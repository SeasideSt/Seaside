private
splitString: aString intoChunksNoLongerThan: anInteger
	^ Array streamContents: [ :stream |
		self
			splitString: aString
			intoChunksNoLongerThan: anInteger
			into: stream ]