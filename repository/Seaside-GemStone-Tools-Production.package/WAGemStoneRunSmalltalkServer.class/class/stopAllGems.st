running script
stopAllGems
	self singleton servers do: [:each | self stopGems: each].