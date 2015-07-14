running script
stopGems: server
	"self stopGems"

	self executeGemCommand: 'stop' for: server