ambiguous
produces: aCollectionOfStrings
	"swagger object: A list of MIME types the APIs can produce. This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
	operation object: A list of MIME types the operation can produce. This overrides the produces definition at the Swagger Object. An empty value MAY be used to clear the global definition. Value MUST be as described under Mime Types."
	self key: 'produces' value: aCollectionOfStrings