adding
rawAddToPath: aString
	"Adds the argument as a path element. If the argument contains $/ it is not split into multiple elements."

	self path add: aString