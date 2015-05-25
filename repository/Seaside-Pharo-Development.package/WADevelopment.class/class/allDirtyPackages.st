accessing-packages
allDirtyPackages
	"Answer all dirty Seaside related packages."
	
	^ self allGRPackages select: [ :each | (self workingCopyFor: each) modified ]