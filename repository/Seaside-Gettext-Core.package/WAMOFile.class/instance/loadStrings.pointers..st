private
loadStrings: strm pointers: table
	"We convert string encoding at load time.
	Currently, we do not take care to set the leadingChar for a languageEnvironment"
	^self loadStrings: strm pointers: table encoding: #utf8 languageEnvironment: nil
