public
clear
	^ mutex critical: [
		cache clear ]