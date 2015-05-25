scripts
collapse: anObject level: anInteger on: aScript
	self recursiveCollapse: anObject on: aScript.
	aScript prototype element
		down: '.indent a';
		removeClassName: 'expanded';
		id: (self uid: anObject on: aScript)