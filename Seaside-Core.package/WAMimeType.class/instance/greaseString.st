converting
greaseString
	| stringSize string stream |
	stringSize := main size + 1 + sub size.
	parameters isNil ifFalse: [
		parameters keysAndValuesDo: [ :key :value |
			stringSize := stringSize + 1 + key size + 1 + value size ] ].
	"allocate with correct size, avoid copy"
	string := String new: stringSize.
	stream := WriteStream on: string.
	stream
		nextPutAll: main;
		nextPut: $/;
		nextPutAll: sub.
	parameters isNil ifFalse: [
		parameters keysAndValuesDo: [ :key :value | 
			stream
				nextPut: $;;
				nextPutAll: key;
				nextPut: $=;
				nextPutAll: value ] ].
	"no need for #contents because we allocated with the correct size"
	^ string