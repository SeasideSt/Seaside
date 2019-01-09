private
filesIn: aPath do: aOneArgumentBlock 
	"this can not be done with SPort"
	(GRPlatform current filesIn: aPath) do: [ :each |
		aOneArgumentBlock value: (GRPlatform current localNameOf: each) ]