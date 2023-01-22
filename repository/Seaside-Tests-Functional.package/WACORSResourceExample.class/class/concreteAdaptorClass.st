accessing
concreteAdaptorClass

	^ WAServerAdaptor withAllSubclasses detect: [ :one | one isAbstract not and:[ one name ~= 'WATestServerAdaptor' ] ]