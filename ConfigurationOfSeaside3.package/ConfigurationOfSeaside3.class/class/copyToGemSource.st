development support
copyToGemSource
	"Copy the current configuration mcz file to http://seaside.gemstone.com/ss/MetacelloRepository"

	"Note you before copying config to GemSource, you should have tested the release in GLASS.
	 You also need to have commit rights to the GemSource repository."

	"self copyToGemSource"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) copyConfiguration: self to: 'http://seaside.gemstone.com/ss/MetacelloRepository'