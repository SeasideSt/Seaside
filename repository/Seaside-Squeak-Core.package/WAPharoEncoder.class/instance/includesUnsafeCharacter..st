private
includesUnsafeCharacter: aString
	^ (ByteString findFirstInString: aString inSet: table startingAt: 1) ~= 0