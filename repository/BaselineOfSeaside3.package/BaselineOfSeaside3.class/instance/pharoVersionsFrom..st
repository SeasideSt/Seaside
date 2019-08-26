utilities
pharoVersionsFrom: aVersion
	"Return a list of pharo version from the major version as parameter to the major version of the image"

	^ (aVersion to: SystemVersion current major) collect: [ :v | ('pharo' , v asString , '.x') asSymbol ]