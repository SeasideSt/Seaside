setup
startAdaptors

	<script>
	WAServerManager default adaptors
		ifEmpty: [ 
			originAdaptor := (self concreteAdaptorClass port:
				                  self originAdaptorPort) start.
			self registerCorsAdaptor ]
		ifNotEmpty: [ :adaptors | 
			originAdaptor := adaptors
				                 detect: [ :one | one port = self originAdaptorPort ]
				                 ifNone: [ self concreteAdaptorClass port: self originAdaptorPort ].
			originAdaptor start.
			corsAdaptor := adaptors
				               detect: [ :one | one port = self corsAdaptorPort ]
				               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
			corsAdaptor start ]