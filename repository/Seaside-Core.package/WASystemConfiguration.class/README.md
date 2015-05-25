You should subclass WASystemConfiguration to define new attributes. The method #describeOn: is passed an instance of WAConfigurationDescription which can be used to create new attributes. The attributes can be configured to specify their default value, label, and so on. See the methods on WAAttribute and its subclasses to see what options are available.

If a configuration needs to override the value of another WASystemConfiguration or depends on its attributes, implement the method "parents", returning a collection of configuration objects.

WASystemConfiguration subclasses are "read-only" in that their attributes, parents, and default values are all specified in code. Users and applications that want to configure values for attributes should create a WAUserConfiguration and specify the WASystemConfiguration in its ancestry.

WASystemConfiguration classes are singleton. You should use #instance on the class side to get the current instance. You cannot call #copy on a WASystemConfiguration.

Subclasses should implement the following messages:
	describeOn:
		
They may also want to implement:
	parents