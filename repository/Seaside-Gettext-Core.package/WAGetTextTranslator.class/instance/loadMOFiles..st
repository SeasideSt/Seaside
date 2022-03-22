accessing
loadMOFiles: paths
	paths 
		do: [ :path |
			self moFileFromPath: path
		].