ambiguous
parameters: anObject
	"swagger object: An object to hold parameters that can be used across operations. This property does not define global parameters for all operations.
	path item object: A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the Swagger Object's parameters. There can be one 'body' parameter at most.
	operation object: A list of parameters that are applicable for this operation. If a parameter is already defined at the Path Item, the new definition will override it, but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the Swagger Object's parameters. There can be one 'body' parameter at most."
	self key: 'parameters' value: [ 
		self object: anObject ]