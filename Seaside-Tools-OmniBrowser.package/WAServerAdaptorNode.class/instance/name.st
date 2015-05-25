public
name
	^ String streamContents: [ :stream |
		stream
			nextPut: $[; print: adaptor port; nextPut: $];
			space;
			nextPutAll: adaptor class name.
		 adaptor class = GRNullCodec ifFalse: [
			stream space; nextPut: $(; nextPutAll:  adaptor codec name; nextPut: $) ] ]