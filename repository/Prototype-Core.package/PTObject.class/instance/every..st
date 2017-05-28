decorations
every: aDuration
	"Execute the receiver every aDuration."

	self addDecoration: (PTPeriodicalExecutor new frequency: aDuration)