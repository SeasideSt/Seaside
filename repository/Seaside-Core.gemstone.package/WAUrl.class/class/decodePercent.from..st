decoding
decodePercent: aString from: start
	"percent decodes the fragment string starting at the given index
	/?:@-._~!$&'()*+,;= are allowed unescaped anywhere within a fragment part"
	^ self decodePercent: aString from: start to: aString size + 1