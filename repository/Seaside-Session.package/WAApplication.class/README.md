WAApplication is the starting point for a Seaside application. When a WAComponent is registered as a top level component a WAApplication object is added to a WADispatcher. The dispatcher forwards all requests to the WAApplication, which in turn forwards them to the correct WASession object. WAApplication's parent class WARegistry maintains a list of all active sessions to the application. 

"configuration" contains a chain of WAConfituration classes that define attributes of the application. The attribute "rootComponent", for example, defines the top level WAComponent class for the application. The configuration chain includes WAUserConfiguration, WAGlobalConfiguration, WARenderLoopConfiguration and WASessionConfiguration. Other configurations can be added to the chain when the top level application is registered with a dispatcher. (See below)

"libraries" is a collection of WALibrary classes, which are used to serve css, javascript and images used by the application. These may be in methods or in files. Sometimes these libraries are replaced by static files served by Apache. See WAFileLibrary class comment for more information.

Registering an Application.
	An application can be registered with a dispatcher by using the Seaside configuration page or via code. Below MyComponent is a subclass of WAComponent. The following registers the component as an application, gives some values to attributes (or preferences) and adds a library and a configuration. 

MyComponent class>>initialize
	"self initialize"
	| application |
	application := self registerAsApplication: 'sample'.
	application preferenceAt: #sessionClass put: Glorp.WAGlorpSession.
	application addLibrary: SampleLibrary.
	application configuration addAncestor: GlorpConfiguration new.
	application preferenceAt: #glorpDatabasePlatform put: Glorp.PostgreSQLPlatform.
	application preferenceAt: #databaseServer put: '127.0.0.1'.
	application preferenceAt: #databaseConnectString put: 'glorptests'.

MyComponent>>someInstanceMethod
	"example of how to access attributes (preferences)"
	self session application preferenceAt: #glorpDatabasePlatform