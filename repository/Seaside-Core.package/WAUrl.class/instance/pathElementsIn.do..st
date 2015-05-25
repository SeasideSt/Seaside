private
pathElementsIn: aString do: aOneArgumentBlock
	GRPlatform
		subStringsIn: aString
		splitBy: $/
		do: aOneArgumentBlock