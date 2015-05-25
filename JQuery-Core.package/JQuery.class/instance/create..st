private
create: aPluginClass
	^ (aPluginClass context: self renderContext owner: self)
		rendererClass: self rendererClass;
		yourself