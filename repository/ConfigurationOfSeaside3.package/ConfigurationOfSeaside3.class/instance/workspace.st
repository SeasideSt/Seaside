accessing
workspace
"Installing and running Seaside implies 3 steps: 1) load the metacello configuration; 2) load the packages; 3) start seaside"

"1) The first step is to install the Metacello configuration. You can do this in several ways. For example, you can just add the repository http://www.squeaksource.com/MetacelloRepository using the MonticelloBrowser and then load the package ConfigurationOfSeaside. Other ways include using Gofer (mostly in Pharo) or Installer (mostly in Squeak)"

"Pharo"
 (Smalltalk at: #Gofer) new
    squeaksource: 'MetacelloRepository';
    package: #ConfigurationOfSeaside3;
    load.

"Squeak trunk, 3.10, images:
	(Installer squeaksource
		project: 'MetacelloRepository';
		packagesMatching: 'ConfigurationOfSeaside-*') first install"

"2) Once the configuration is load, now you should load the packages that you want. You may want to install only Seaside or install also Pier or Magritte. You may also want tests or addons. For example, to load Seaside 2.8:"

ConfigurationOfSeaside3 project latestVersion load: 'Seaside 2.8'.

"There are several combinations. Here are other examples:"

"Seaside2.8"
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Seaside 2.8 Examples' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Magritte' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Magritte Tests' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Magritte' 'Pier' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Magritte' 'Pier Tests' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 2.8' 'Magritte' 'Pier' 'Pier AddOns' ).

"Load explicit version of Pier, Magritte and Seaside2.8, including tests"
(ConfigurationOfSeaside3 project version: '1.0.7')
	load: #('Seaside 2.8' 'Seaside 2.8 Examples' 'Magritte Tests' 'Pier Tests' 
				'Pier AddOns').

"Seaside3.0 - load full code base for Seaside3.0 including development tools"
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' 'Magritte2' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' 'Magritte2 Tests' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' 'Magritte2' 'Pier2' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' 'Magritte2' 'Pier2 Tests' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0' 'Magritte2' 'Pier2' 'Pier2 AddOns' ).

"Seaside3.0 - minimum load ...
  Seaside 3.0 Production - Seaside 3.0 base plus adaptors ... no Seaside applications loaded"
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0 Production' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0 Production' 'Magritte2' ).
ConfigurationOfSeaside3 project latestVersion load: #( 'Seaside 3.0 Production' 'Pier2' 'Pier2 AddOns' ).

"Load explicit version of Pier, Magritte and Seaside3.0, including tests"
"See http://code.google.com/p/glassdb/wiki/Seaside30Configuration#Load_Pier,_Magritte,_and_Seaside_Avoiding_Out_of_Memory_Conditio when loading Seaside3.0, Magritte and Pier into GLASS"
(ConfigurationOfSeaside3 project version: '1.0.7')
	load: #('Seaside 3.0' 'Magritte2 Tests' 'Pier2 Tests' 'Pier2 AddOns').

"Load bleeding edge Seaside 3.0 mcz files"
(Smalltalk at: #Gofer) new
    squeaksource: 'MetacelloRepository';
    package: 'ConfigurationOfGrease';
    package: #ConfigurationOfSeaside3;
    package: 'ConfigurationOfMagritte2';
    package: 'ConfigurationOfPier2';
    package: 'ConfigurationOfPierAddOns2';
    load.
((Smalltalk at: #ConfigurationOfGrease) project version: '1.0.1-baseline') load: 'ALL'.
((Smalltalk at: #ConfigurationOfSeaside3) project version: '3.0.1-baseline') load: 'ALL'.
((Smalltalk at: #ConfigurationOfMagritte2) project version: '2.0.6-baseline') load: 'ALL'.
((Smalltalk at: #ConfigurationOfPier2) project version: '2.0.7-baseline') load: 'ALL'.
((Smalltalk at: #ConfigurationOfPierAddOns2) project version: '2.0.7-baseline') load: 'ALL'.


"3) Once you have installed all the packages you want, you will probably want to start the Seaside web server. The easiest (but not the only one) is evaluating: "
(Smalltalk at: #WAKom) startOn: 8080.            	"Pharo or Squeak ... default adaptor for Pier2"
(Smalltalk at: #WASwazooAdaptor) startOn: 8080.  	"Pharo, GemStone or Squeak"
(Smalltalk at: #WAGsSwazooAdaptor) startOn: 8080. "GemStone"
"Then go to http://localhost:8080/seaside"