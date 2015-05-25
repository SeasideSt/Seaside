initialization
configureApplicationDefaults: aSharedConfiguration
	"WARenderLoopConfiguration is added by default because most users will use WASession and the Render Loop."
	(aSharedConfiguration parents includes: WARenderLoopConfiguration instance) ifFalse: [
		aSharedConfiguration addParent: WARenderLoopConfiguration instance ]