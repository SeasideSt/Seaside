effects
parallel: aCollection
	"This is a special effect to allow to combine more than one core effect into a parallel effect."

	self create; method: 'Parallel'; arguments: (Array with: aCollection)