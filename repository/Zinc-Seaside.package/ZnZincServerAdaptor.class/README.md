I convert between Seaside and Zinc HTTP requests and responses.
I am a WAServerAdaptor.

Instance Variables:
	server	<ZnServer>
		
I can be started like any other Seaside adaptor:

	ZnZincServerAdaptor startOn: 8080
	
I work together with a ZnSeasideServerAdaptorDelegate. I offer several advanced configuration options for specialized applications in my 'initialize-release' protocol. See also the 'example' class protocol of ZnSeasideServerAdaptorDelegate. 