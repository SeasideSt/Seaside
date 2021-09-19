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
				                 detect: [ :one | 
				                 one port = self originAdaptorPort ]
				                 ifFound: [ :adaptor | adaptor start ]
				                 ifNone: [ 
				                 (self concreteAdaptorClass port:
					                  self originAdaptorPort) start ].
			corsAdaptor := adaptors
				               detect: [ :one | one port = self corsAdaptorPort ]
				               ifFound: [ :adaptor | adaptor start ]
				               ifNone: [ 
				               (self concreteAdaptorClass port:
					                self corsAdaptorPort) start ] ]