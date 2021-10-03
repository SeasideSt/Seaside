accessing
concreteAdaptorClass

	^ WAServerAdaptor withAllSubclasses detect: [ :one | one isAbstract not ]