parsing
absolute: aString relative: aRelativeString
	"Take absolute URL aString and combine it with a relative path aRelativeString."

	^ (self absolute: aString)
		parsePath: aRelativeString;
		yourself