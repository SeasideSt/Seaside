copying
copy
	"Some of our operations replace the collections sotred in our instance variables. We don't
	want a copy to be made in the middle of this process (or it might have an unmatched pair)
	so we need to copy within our mutex."
	^ mutex critical: [ super copy ]