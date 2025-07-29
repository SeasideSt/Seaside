*Javascript-Pharo-Core
javascriptOn: aRenderer
	"unoptimize, assumed to not be performance ciritcal"
	aRenderer string: (String streamContents: [ :stream |
		stream
			nextPut: $#;
			nextPutAll: (((self red * 255) truncated printStringBase: 16)
								padLeftTo: 2 with: $0);
			nextPutAll: (((self green * 255) truncated printStringBase: 16)
								padLeftTo: 2 with: $0);
			nextPutAll: (((self blue * 255) truncated printStringBase: 16)
								padLeftTo: 2 with: $0) ])