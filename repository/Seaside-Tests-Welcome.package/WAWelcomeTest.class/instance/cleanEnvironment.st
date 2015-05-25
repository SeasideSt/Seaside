private
cleanEnvironment
	WAAdmin unregister: 'WAWelcomeTestTemp'.
	Smalltalk globals at: #WAWelcomeTestTemp ifPresent: [ :testClass | testClass removeFromSystem ]