*seaside-gemstone-flow
seasideGemStoneFlow
	^ self new
		name: 'Seaside-GemStone-Flow';
		addDependency: 'Seaside-Flow';
		addDependency: 'Grease-GemStone-Core';
		addDependency: 'Seaside-GemStone-Continuation';
		url: #gemstoneUrl;
		yourself