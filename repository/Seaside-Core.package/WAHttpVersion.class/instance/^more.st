comparing
> otherVersion
	^ (major > otherVersion major) or: [
		(major = otherVersion major) and: [ minor > otherVersion minor ] ]