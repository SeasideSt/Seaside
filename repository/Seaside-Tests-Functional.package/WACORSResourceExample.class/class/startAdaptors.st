setup
startAdaptors

	<script>
	WAServerManager default adaptors
		ifEmpty: [ 
			OriginAdaptor := (self concreteAdaptorClass port:
				                  self originAdaptorPort) start.
			self registerCorsAdaptor ]
		ifNotEmpty: [ :adaptors | 
			OriginAdaptor := adaptors
				                 detect: [ :one | one port = self originAdaptorPort ]
				                 ifNone: [ self concreteAdaptorClass port: self originAdaptorPort ].
			OriginAdaptor start.
			CorsAdaptor := adaptors
				               detect: [ :one | one port = self corsAdaptorPort ]
				               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
			CorsAdaptor start ]