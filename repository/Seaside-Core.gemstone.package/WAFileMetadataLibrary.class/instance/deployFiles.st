actions
deployFiles
	"Write to disk the files that the receiver use to serve as methods.
	The files are stored in a subfolder named like the classname of the receiver in a subfolder of Smalltalk image folder."
	
	GRPlatform current ensureExistenceOfFolder: self name.
	self fileSelectors do: [ :each | 
		| folderInfo |
		folderInfo := self asFileAndFoldername: each.
 		GRPlatform current ensureExistenceOfFolder: folderInfo first.
		GRPlatform current 
			write: (self fileResourceOf: each) contents value
			toFile: folderInfo second
			inFolder: folderInfo first ]