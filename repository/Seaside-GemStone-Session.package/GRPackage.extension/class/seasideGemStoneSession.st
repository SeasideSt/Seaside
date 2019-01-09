*seaside-gemstone-session
seasideGemStoneSession
	^ self new
		name: 'Seaside-GemStone-Session';
		addDependency: 'Seaside-Session';
		url: #gemstoneUrl;
		yourself