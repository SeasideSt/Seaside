The following load expression will load the 'default' group for Seaside3.1:

   (ConfigurationOfSeaside3 project version: '3.1.0') load.

   alternatively you can also load the stable version using:
	 (ConfigurationOfSeaside3 project version: #stable) load.
	
    or you can load older versions of Seaside (3.0.x):
	 (ConfigurationOfSeaside3 project version: '3.0.10') load.
	
By default all of the packages and projects associated with the Seaside3
project will be loaded.

Here is the list of groups for Seaside 3.1:
   - 'Core'
   - 'Base' (identical to Core, for backwards compatibility)
   - 'Tests'
   - 'Email'
   - 'Examples'
   - 'Development'
   - 'Development Tests'
   - 'Production' (GemStone only)
   - 'Javascript'
   - 'Javascript Tests'
   - 'JQuery'
   - 'JQuery Tests'
   - 'JQueryUI'
   - 'JQueryUI Tests'
   - 'JQueryUI Examples'
   - 'JSON'
   - 'JSON Tests'
   - 'OmniBrowser'
   - 'REST'
   - 'RSS'
   - 'RSS Tests'
   - 'RSS Examples'
   - 'Scriptaculous'
   - 'Scriptaculous Tests'
   - 'Welcome'
   - 'Welcome Tests'
   - 'OneClick'
   - 'Comet' 
   - 'Comet Tests'
   - 'Comet Examples'
   - 'Filesystem'
   - 'Filesystem Tests'

And the following groups are for loading adapters.

   - 'Comanche' and 'Kom'
   - 'FastCGI'
   - 'Swazoo'
   - 'WebClient'
   - 'Zinc'

The '... Tests' group include the test packages for the named group. Usually there is no benefit in loading these unless to want to work on those packages.
The '... Examples' group include the examples packages for the named group

   - 'Core' is the absolute minimum set of packages that should be
     loaded to get expected Seaside functionality
   - 'Development' adds in the Seaside development tools. It should be
     noted that it is not recommended that the Seaside development tools
     be loaded in a production image, because the tools are not considered
     essential or safe.
   - 'OmniBrowser' loads OmniBrowser as well as related tools like the
     server browser.
   - The other groups should be more or less self explanatory.

It is recommended that you load the 'Core' group and groups for the
additional functionality that you need.

You must choose at least one adaptor (Seaside-Adaptors-Swazoo or Seaside-Adaptors-Comanche), so in 
theory the absolute minimum loadable unit for Seaside30 would be:

   (ConfigurationOfSeaside3 project version: '3.1.0)
     load: #('Core' 'Kom').

Note that there are no pre-defined components registered in this case, 
so even if you manually start WAKom:

   WAKom startOn: 8080

the only page you can hit is the files page:

   http://localhost:8080/files

You could load the example packages:

  (ConfigurationOfSeaside3 project version: '3.1.0')
     load: #('Examples').

to have a few more pages to hit:

   http://localhost:8080/examples/examplebrowser

but without the familiar development tools you might not have an 
enjoyable experience. You can add in the development tools with the 
following expression:

  (ConfigurationOfSeaside3 project version: '3.1.0')
     load: #('Development').

Only then will you see the familiar Dispatcher page when you hit:

   http://localhost:8080/

At this point in time, the only things that you won't have loaded 
(because of package dependencies) are:

   - Comet
   - Swazoo
   - RSS support
   - javascript support
   - HTML5 support
   - EMail
   - Welcome page

To add the remaining pieces you'd now have to list the individual 
packages