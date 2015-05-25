system startup
startUp
	"in case seeding fails alway fail"
	self installFailing.
	self canSeed ifTrue: [
		self seed.
		self install ]