WAUserConfiguration is a composite of configurations.  This composite of configurations is stored in the field "parents". WAUserConfiguration provides methods to dynamically provide non-default values for attributes. WAUserConfiguration inherits attributes and values defined in its ancestors. If WAUserConfiguration does not have a value for an attribute it will search its ancestors for a value, stopping when it finds a value.

An instance of WAUserConfiguration is the first configuration added to a Seaside application (WAApplication). All other configurations added to the application are added as ancestors of this instance. When a value for an attribute is set either by the standard Seaside component configuration page or in code the value is added to the "values" dictionary in WAUserConfiguration.

Instance Variables:
	parents	<Collection of: WAConfiguration>	 hierarchy of configurations defining all attributes for this instance of WAUserConfiguration
	values	<Dictionary>	the dictionary key is an attribute key, dictionary value is value of that attribute 
