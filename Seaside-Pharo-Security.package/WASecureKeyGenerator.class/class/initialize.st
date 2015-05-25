initialization
initialize
	GRPlatform current addToStartUpList: self.
	"in case seeding fails alway fail"
	self installFailing.
	self canSeed ifTrue: [
		self beSha1.
		self seed.
		self install ]