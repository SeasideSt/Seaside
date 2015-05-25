packages-basic
basicPackages

	^OrderedCollection new
		add: self greasePackages;			"Platform"
		add: self corePackages;			"Core"
		add: self canvasPackages;			"Canvas"
		add: self sessionPackages;			"Session"
		add: self componentPackages;		"Component"
		add: self renderLoopPackages;		"RenderLoop"
		add: self toolsPackages;			"Tools"
		add: self widgetsPackages;			"Widgets"
		add: self environmentPackages;	"Environment"
		yourself.