A configuration for a Seaside application contains attributes which can be used by Seaside and the application. WAConfiguration hierarchy uses the composite pattern.

Subclasses of WASystemConfiguration define and configure related groups of attributes. See WASystemConfiguration class comment for information on defining your own attributes.

WAUserConfiguration is a composite of configurations. The set of configurations contained in WAUserConfiguration is called the ancestors. Attribute values in a configuration override the attribute values in the ancestors. WAUserConfiguration also holds the non-default values of attributes.

Seaside applications start with a WAUserConfiguration (see WAApplication>>configuration) a single parent: WARenderLoopConfiguration. The full ancestry also includes WASessionConfiguration WAGlobalConfiguration. Other configurations can be added to an application on the Seaside configuration page for the application or in your application. Values for the attributes can be given in either location. 

See Seaside documentation (http://www.seaside.st/documentation) on configuration and preferences (http://www.seaside.st/documentation/Configuration%20and%20Preferences) for more information.

Example of setting attributes and adding configurations in code
ASubclassOfWAComponent class>>initialize
	"self initialize"
	| application |
	application := self registerAsApplication: 'GlorpExample'.
	"set a standard attribute"
	application preferenceAt: #sessionClass put: Glorp.WAGlorpSession. 

	"add a configuration"
	application configuration addParent: GlorpConfiguration new.
	application preferenceAt: #databaseLogin put: 'foo'. "set attribute defined in GlorpConfiguration"

Subclasses must implement the following messages:
	name
		return the name of the configuration

	localValueAt:ifAbsent:
		return the value of the attribute given as first argument