private
loadStringPointers: strm offset: tableOffset
	"returns tupple { arrayOfOffsetToString . arrayOfLengthOfString }"
	| offsetTable lenTable len offset tupple |
	offsetTable := Array new: nStrings.
	lenTable := Array new: nStrings.

	strm position: tableOffset.
	1 to: nStrings do: [ :index |
		len := self nextInt32From: strm.
		offset := self nextInt32From: strm.
		offsetTable at: index put: offset.
		lenTable at: index put: len ].
	tupple := Array new: 2.
	tupple at: 1 put: offsetTable.
	tupple at: 2 put: lenTable.
	^ tupple
