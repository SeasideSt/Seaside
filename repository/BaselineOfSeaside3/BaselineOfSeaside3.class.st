"
The following load expression will load the 'default' group for Seaside3:

	BaselineOfSeaside3 project load.
	
By default all of the packages and projects associated with the Seaside3
project will be loaded.

Here is the list of groups for Seaside 3:
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
     loaded to get expected traditional Seaside functionality with
     components and session.
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

	BaselineOfSeaside3  project 
		load: #('Core' 'Zinc').

Note that there are no pre-defined components registered in this case, 
so even if you manually start WAKom:

	ZnZincServerAdaptor startOn: 8080

the only page you can hit is the files page:

	http://localhost:8080/files

You could load the example packages:

	BaselineOfSeaside3  project 
		load: #('Examples').

to have a few more pages to hit:

	http://localhost:8080/examples/examplebrowser

but without the familiar development tools you might not have an 
enjoyable experience. You can add in the development tools with the 
following expression:

	BaselineOfSeaside3  project
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
"
Class {
	#name : 'BaselineOfSeaside3',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSeaside3',
	#package : 'BaselineOfSeaside3'
}

{ #category : 'baselines' }
BaselineOfSeaside3 >> baseline: spec [

	<baseline>
	"This groups all baseline"
	self baselinecommon: spec.
	self baselinegemstone: spec.
	self baselinepharo: spec.
	self baselinesqueak: spec.
	self baselineslime: spec.
	self baselinefilesystem: spec.
	self baselineadaptors: spec.
	self baselinecomet: spec.
	self baselinejavascript: spec.
	self baselinejquery: spec.
	self baselinejqueryui: spec.
	self baselinerss: spec.
	self baselinerest: spec.
	self baselinescriptaculous: spec.
	self baselinejson: spec.
	self baselineob: spec.
	self baselinegettext: spec.
	self baselinewelcome: spec.
	self baselinesecurity: spec
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselineadaptors: spec [
	spec
		for: #( #squeakCommon #'gs3.0.x' #'gs3.1.x' #'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' )
		do: [ spec
				project: 'Swazoo2'
				with: [ spec
						versionString: #stable;
						className: 'ConfigurationOfSwazoo2';
						loads: #('Swazoo');
						repository: 'http://smalltalkhub.com/mc/Swazoo/Swazoo/main' ].
			spec
				package: 'Seaside-Swazoo'
					with: [ spec
						requires: #('Grease' 'Swazoo2');
						repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
			spec group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo') ].

	spec
		for: #squeakCommon
		do: [ spec
				project: 'WebClient Project'
				with: [ spec
						versionString: '1.5';
						className: 'ConfigurationOfWebClient';
						loads: #('Core');
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].
			spec
				package: 'WebClient-Seaside-Adaptor'
				with: [
					spec
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient';
					 	requires: #('WebClient Project' 'Seaside-Core') ].
			spec group: 'WebClient' with: #('WebClient-Seaside-Adaptor') ].

	spec for: #squeak do: [ spec package: 'WebClient-Seaside-OB' with: [ spec requires: #('OB' 'Seaside-Tools-OmniBrowser') ] ].

	spec
		for: #pharo
		do: [
			spec
				package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
				package: 'KomHttpServerLight' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Seaside/KomHttpServer/main' ];
				package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Adaptors-Comanche') ];
				package: 'Seaside-Zinc-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Zinc-Pharo' with: [ spec requires: #('Seaside-Zinc-Core') ];
				package: 'Seaside-Zinc-Tests' with: [ spec requires: #('Seaside-Zinc-Pharo') ].
			spec
				group: 'Kom' with: #('Seaside-Adaptors-Comanche');
				group: 'Zinc' with: #('Seaside-Zinc-Pharo');
				group: 'Tests' with: #('Seaside-Zinc-Tests');
				group: 'default' with: #('Zinc');
				group: 'CI' with: #('Zinc') ].

	spec
		for: #gemstone
		do: [ spec
				project: 'FastCGI Project'
					with: [ spec
						className: 'ConfigurationOfGsFastCGI';
						versionString: #stable;
						loads: #('FastCGI');
						repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
				baseline: 'GsApplicationTools'
					with: [ spec
						loads: 'Core';
						repository: 'github://GsDevKit/gsApplicationTools:master/repository' ];
				baseline: 'Zinc Project'
					with: [ spec
						className: 'BaselineOfZincHTTPComponents';
						loads: #('Core');
						repository: 'github://GsDevKit/zinc:gs_master/repository' ].
			spec
				package: 'Seaside-GemStone-GemServer-Core' with: [ spec requires: #('GsApplicationTools' 'Seaside-Core') ];
				package: 'Seaside-GemStone-GemServer-Tests' with: [ spec requires: #('Seaside-GemStone-GemServer-Core' 'Seaside-GemStone-Development' 'Seaside-GemStone-Adaptors-Zinc' 'Seaside-Adaptors-FastCGI') ];
				package: 'Seaside-Zinc-Core'
					with: [ spec
						requires: #('Zinc Project' 'Seaside-Core');
						includes: #('Seaside-GemStone-Adaptors-Zinc') ];
				package: 'Seaside-Adaptors-FastCGI' with: [ spec requires: #('Seaside-Core' 'FastCGI Project' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-GemStone-Adaptors-Zinc' with: [ spec requires: #('Seaside-Zinc-Core' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-Zinc-Tests' with: [ spec requires: #('Seaside-Zinc-Core') ].
			spec
				group: 'FastCGI' with: #('Seaside-Adaptors-FastCGI');
				group: 'Tests' with: #('Seaside-GemStone-GemServer-Tests' 'Seaside-Zinc-Tests');
				group: 'Zinc' with: #('Seaside-Zinc-Core') ].

	spec
		for:  #(#'gs3.0.x' #'gs3.1.x' #'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' )
		do: [
			spec
				package: 'Seaside-GemStone-GemServer-Tests' with: [ spec includes: #( 'Seaside-GemStone-GemServer-Swazoo-Tests') ];
				package: 'Seaside-GemStone-GemServer-Swazoo-Tests' with: [ spec requires: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Seaside-GemStone-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Adaptors-Swazoo' 'Seaside-GemStone-GemServer-Core') ] ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinecomet: spec [

	spec for: #'squeakCommon' do: [
		spec blessing: #baseline.
		spec 
			package: 'Comet-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Canvas' ) ];
			package: 'Comet-Tests-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Comet-Core' ) ];
			package: 'Comet-Examples' with: [
				spec requires: #('JQuery-Core' 'Comet-Core') ].
		
		spec 
			package: 'Comet-Core' with: [
				spec includes: #('Comet-Pharo-Core' ) ];
			package: 'Comet-Pharo-Core' with: [
				spec requires: #('Comet-Core' ) ].
			
		spec 
			group: 'Comet' with: #('Comet-Core');
			group: 'Comet Tests' with: #('Comet-Tests-Core' );
			group: 'Comet Examples' with: #('Comet-Examples' );
			group: 'Tests' with: #('Comet Tests') ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinecommon: spec [

	spec for: #'squeakCommon' do: [ 
      spec
			baseline: 'Grease'
        	with: [ 
				spec
					loads: #('Grease-Core');
					repository: 'github://SeasideSt/Grease:v1.17.x/repository' ].
		spec
			project: 'Grease Core Tests' copyFrom: 'Grease' with: [ 
				spec loads: #('Core Tests') ] 
	].

	spec for: #'gemstone' do: [ 
      spec
			baseline: 'Grease'
        	with: [ 
				spec
					loads: #('Grease-Core');
					repository: 'github://GsDevKit/Grease:master/repository' ].
		spec
			project: 'Grease Core Tests' copyFrom: 'Grease' with: [ 
				spec loads: #('Core Tests') ] 
	].

	spec for: #'common' do: [
		 spec
			baseline: 'Parasol'
        	with: [ 
				spec
					repository: 'github://SeasideSt/Parasol:master/repository';
					loads: 'default' ].
		spec
			package: 'Seaside-Canvas' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Component' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Core' with: [
				spec requires: #('Grease' ). ];
			package: 'Seaside-Continuation' with: [
				spec requires: #('Grease' ). ];
			package: 'Seaside-Development' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Flow'). ];
			package: 'Seaside-Email' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Environment' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Widgets' ). ];
			package: 'Seaside-Examples' with: [
				spec requires: #('Seaside-Component' 'Seaside-Canvas' 'Seaside-Tools-Core' 'Seaside-Development' 'JQuery-Core'). ];
			package: 'Seaside-Flow' with: [
				spec requires: #('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' ). ];
			package: 'Seaside-InternetExplorer' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-RenderLoop' with: [
				spec requires: #('Seaside-Component' 'Seaside-Session' ). ];
			package: 'Seaside-Session' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ). ];
			package: 'Seaside-Tools-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Session' ). ];
			package: 'Seaside-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Core' 'Seaside-RenderLoop' 'Seaside-Widgets' ) ];
			package: 'Seaside-Widgets' with: [
				spec requires: #('Seaside-Component' 'Seaside-Canvas' ) ];
			package: 'Seaside-HotwireTurbo-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Component' 'Seaside-Canvas' 'Seaside-RenderLoop' ) ];
			package: 'Seaside-HotwireTurbo-Examples' with: [
				spec requires: #('Seaside-HotwireTurbo-Core' 'Seaside-Examples') ];
			package: 'Seaside-Tests-Canvas' with: [
				spec requires: #('Seaside-Tests-Core' 'Seaside-Canvas' ). ];
			package: 'Seaside-Tests-Component' with: [
				spec requires: #('Seaside-Component' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-Core' with: [
				spec requires: #('Seaside-Core' 'Grease Core Tests' ). ];
			package: 'Seaside-Tests-Development' with: [
				spec requires: #('Seaside-Development' 'Seaside-Tests-Tools-Web' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-Email' with: [
				spec requires: #('Seaside-Email' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-Environment' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop' 'Seaside-Tests-Session' 'Seaside-Tests-Canvas' ). ];
			package: 'Seaside-Tests-Examples' with: [
				spec requires: #('Seaside-Examples' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-Flow' with: [
				spec requires: #('Seaside-Flow' 'Seaside-Tests-Functional' ). ];
			package: 'Seaside-Tests-Functional' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Tests-Core' 'Seaside-Widgets' 'Seaside-REST-Core'). ];
			package: 'Seaside-Tests-InternetExplorer' with: [
				spec requires: #('Seaside-InternetExplorer' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-RenderLoop' with: [
				spec requires: #('Seaside-RenderLoop' 'Seaside-Tests-Session' ). ];
			package: 'Seaside-Tests-Session' with: [
				spec requires: #('Seaside-Tests-Core' 'Seaside-Session' 'Seaside-Tests-Canvas'). ];
			package: 'Seaside-Tests-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-UTF8' with: [
				spec requires: #('Seaside-Tests-Core' ) ];
			package: 'Seaside-Tests-Parasol' with: [
				spec requires: #('Parasol' 'Seaside-Tests-Functional' 'Seaside-Tools-Core') ].
		spec 
			group: 'default' with: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'JQueryUI' 'Seaside-Examples' 'Seaside-Welcome');
			group: 'OneClick' with: #('Tests' 'Development' 'Zinc');
			group: 'CI' with: #('Tests' 'Development Tests' 'Seaside-HotwireTurbo-Core');
			group: 'Core' with: #('Seaside-Core' 'Seaside-Continuation' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Flow' 'Seaside-Environment' 'Seaside-Widgets' );
			group: 'Tests' with: #('Core' 'Seaside-Tests-Core' 'Seaside-Tests-Canvas' 'Seaside-Tests-Session' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop' 'Seaside-Tests-Environment' 'Seaside-Tests-Flow' 'Seaside-Tests-UTF8' 'Seaside-Tests-InternetExplorer' 'Seaside-Tests-Email' 'Seaside-Tests-Examples' 'RSS Tests' 'Welcome Tests' 'REST Tests' 'Swagger Tests' 'Seaside-Tests-Parasol');
			group: 'Hotwired' with: #('Seaside-HotwireTurbo-Core');
			group: 'Development' with: #('Core' 'Seaside-Development');
			group: 'Development Tests' with: #('Development' 'Core' 'Seaside-Tests-Development');
			group: 'Email' with: #('Seaside-Email');
			group: 'Examples' with: #('Core' 'Seaside-Examples' 'Seaside-REST-Examples' 'Seaside-HotwireTurbo-Examples');
			group: 'Base' with: #('Core')  ].

]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinefilesystem: spec [
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Seaside-FileSystem'
          with: [ spec requires: #('Seaside-Core') ];
        package: 'Seaside-Tests-FileSystem'
          with: [ spec requires: #('Seaside-FileSystem') ].
      spec
        group: 'Filesystem' with: #('Seaside-FileSystem');
        group: 'Filesystem Tests'
          with: #('Filesystem' 'Seaside-Tests-FileSystem');
        group: 'Tests' with: #('Filesystem Tests') ].
  spec
    for: #'pharo'
    do: [ 
      spec
        package: 'Seaside-Pharo-FileSystem';
        package: 'Seaside-FileSystem'
          with: [ spec includes: 'Seaside-Pharo-FileSystem' ] ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Seaside-GemStone-FileSystem';
        package: 'Seaside-FileSystem'
          with: [ spec includes: 'Seaside-GemStone-FileSystem' ].
      spec
        group: 'Filesystem' with: #('Seaside-FileSystem'). ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinegemstone: spec [
  spec
    for: #'gemstone'
    do: [ 
      spec blessing: #'baseline'.
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('Base');
                repository: 'github://glassdb/glass:master/repository' ].

      spec
        package: 'Seaside-Squeak-Compatibility';
        package: 'Seaside-Core'
          with: [ 
              spec
                includes: #('Seaside-GemStone-Core');
                requires: #('GLASS1' 'Seaside-Squeak-Compatibility') ];
        package: 'Seaside-Development'
          with: [ spec includes: #('Seaside-GemStone-Development') ];
        package: 'Seaside-Email'
          with: [ spec includes: #('Seaside-GemStone-Email') ];
        package: 'Seaside-Flow'
          with: [ spec includes: #('Seaside-GemStone-Flow') ];
        package: 'Seaside-Environment'
          with: [ 
              spec
                includes:
                  #('Seaside-GemStone-Environment' 'Seaside-GemStone-Tools-Production') ];
        package: 'Seaside-Session'
          with: [ spec includes: #('Seaside-GemStone-Session') ];
        package: 'Seaside-Tools-Web'
          with: [ spec includes: #('Seaside-GemStone-Tools-Web') ];
        package: 'Seaside-Tests-Core'
          with: [ spec includes: #('Seaside-Tests-GemStone-Core') ];
        package: 'Seaside-Tests-Development'
          with: [ spec includes: #('Seaside-Tests-GemStone-Development') ];
        package: 'Seaside-Tests-Flow'
          with: [ 
              spec
                includes:
                  #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow') ];
        package: 'Seaside-Tests-Functional'
          with: [ spec includes: #('Seaside-Tests-GemStone-Functional') ];
        package: 'Seaside-GemStone-Basic-Development'
          with: [ spec requires: #('Seaside-Core') ];
        package: 'Seaside-GemStone-Continuation'
		    with: [ spec requires: #('Seaside-Core' 'Seaside-Continuation') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-Core') ];
        package: 'Seaside-GemStone-Development'
          with: [ 
              spec
                requires:
                  #('Seaside-Development' 'Seaside-GemStone-Basic-Development' 'Seaside-GemStone-Tools-Production') ];
        package: 'Seaside-GemStone-Email'
          with: [ spec requires: #('Seaside-Email') ];
        package: 'Seaside-GemStone-Environment'
          with: [ spec requires: #('Seaside-Environment') ];
        package: 'Seaside-GemStone-Flow'
          with: [ spec requires: #('Seaside-Flow' 'Seaside-GemStone-Continuation') ];
        package: 'Seaside-GemStone-ServiceTask'
          with: [ spec requires: #('Seaside-GemStone-Tools-Production') ];
        package: 'Seaside-GemStone-Session'
          with: [ spec requires: #('Seaside-Session') ];
        package: 'Seaside-GemStone-Tools-Production'
          with: [ spec requires: #('Seaside-Widgets' 'Seaside-GemStone-Basic-Development') ];
        package: 'Seaside-GemStone-Tools-Web'
          with: [ spec requires: #('Seaside-Tools-Web') ];
        package: 'Seaside-Tests-GemStone-Core'
          with: [ spec requires: #('Seaside-Tests-Core') ];
        package: 'Seaside-Tests-GemStone-Development'
          with: [ spec requires: #('Seaside-Tests-Development') ];
        package: 'Seaside-Tests-GemStone-Continuation'
          with: [ spec requires: #('Seaside-GemStone-Continuation') ];
        package: 'Seaside-Tests-GemStone-Flow'
          with: [ spec requires: #('Seaside-Tests-Flow') ];
        package: 'Seaside-Tests-GemStone-Functional'
          with: [ spec requires: #('Seaside-Tests-Functional') ].
     spec
        group: 'CI' with: #('Seaside-Tools-Core' 'FastCGI' 'Zinc');
        group: 'Development' with: #('Seaside-GemStone-Basic-Development');
        group: 'Production' with: #('Seaside-GemStone-Tools-Production') ].
  spec
    for: #(#'gs3.0.x' #'gs3.1.x')
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone300-Core') ];
        package: 'Seaside-GemStone300-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone300-Core') ] ].
	spec
		for:  #(#'gs3.0.x' #'gs3.1.x' #'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x')
		do: [
      spec
        group: 'CI' with: #('Swazoo') ].
  spec
    for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x' #'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone320-Core') ];
        package: 'Seaside-GemStone320-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone320-Core') ] ].
  spec
    for: #(#'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone370-Core') ];
        package: 'Seaside-GemStone370-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone370-Core') ] ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinegettext: spec [

  spec
    for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x' #'pharo12.x' #'gemstone')
    do: [ 
      spec
        package: 'Seaside-Gettext-Core'
          with: [ spec requires: #('Seaside-Session') ];
        package: 'Seaside-Gettext-Examples'
          with: [ spec requires: #('Seaside-Examples' 'Seaside-Gettext-Core') ];
        package: 'Seaside-Tests-Gettext-Core'
          with: [ spec requires: #('Seaside-Gettext-Core') ];
        package: 'Seaside-Tests-Gettext-Examples'
          with: [ spec requires: #('Seaside-Gettext-Examples') ].
      spec
        group: 'Seaside-Gettext' with: #('Seaside-Gettext-Core');
        group: 'Gettext-Examples'
          with: #('Seaside-Gettext' 'Seaside-Gettext-Examples');
        group: 'Tests' with: #('Seaside-Tests-Gettext-Core' 'Gettext-Examples') ].
  spec
    for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x' #'pharo12.x')
    do: [ 
      spec
        package: 'Seaside-Pharo-Gettext-Core';
        package: 'Seaside-Gettext-Core'
          with: [ spec includes: 'Seaside-Pharo-Gettext-Core' ];
        package: 'Seaside-Tests-Pharo-Gettext'
          with: [ spec requires: 'Seaside-Pharo-Gettext-Core' ].
      spec
        group: 'Tests' with: #('Seaside-Tests-Pharo-Gettext') ].
  spec
    for: #(#'gemstone')
    do: [ 
      spec
        package: 'Seaside-GemStone-Gettext-Core';
        "package: 'Seaside-GemStone-Gettext-Examples';"
        package: 'Seaside-Gettext-Core'
          with: [ spec includes: #('Seaside-GemStone-Gettext-Core') ]";
		  package: 'Seaside-Gettext-Examples'
			with: [ spec includes: #('Seaside-GemStone-Gettext-Examples') ]" ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinejavascript: spec [

	spec for: #'common' do: [

		spec 
			package: 'Javascript-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ) ];
			package: 'Javascript-Tests-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Tests-Core' ) ];
			package: 'Seaside-Ajaxifier-Core' with: [
				spec requires: #('Seaside-Core') ].
		spec 
			group: 'Javascript' with: #('Javascript-Core');
			group: 'Javascript Tests' with: #('Javascript-Tests-Core' );
			group: 'Tests' with: #( 'Javascript Tests' );
			group: 'Ajaxifier' with: #( 'Seaside-Ajaxifier-Core' ) ].
		
	spec for: #squeak do: [
		spec 
			package: 'Javascript-Squeak-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Squeak-Core' ) ].
		spec 
			package: 'Javascript-Tests-Pharo-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Javascript-Squeak-Core' ) ].
		spec 
			package: 'Javascript-Core' with: [
				spec includes: #('Javascript-Squeak-Core' ) ];
			package: 'Javascript-Tests-Core' with: [
				spec includes: #('Javascript-Tests-Pharo-Core' ) ] ].
		
	spec for: #pharo do: [
		spec 
			package: 'Javascript-Pharo-Core' with: [ spec requires: #('Javascript-Core' 'Seaside-Pharo-Core' ) ];
			package: 'Javascript-Tests-Pharo-Core' with: [ spec requires: #('Javascript-Tests-Core' 'Javascript-Pharo-Core' ) ];
			package: 'Javascript-Core' with: [ spec includes: #('Javascript-Pharo-Core' ) ];
			package: 'Javascript-Tests-Core' with: [ spec includes: #('Javascript-Tests-Pharo-Core' ) ] ].
		
	spec for: #'pharo7.x' do: [		
		spec
			package: 'Javascript-Pharo70-Extensions' with: [ spec requires: #('Javascript-Core' 'Seaside-Pharo-Core' ) ];
			package: 'Javascript-Pharo-Core' with: [ spec includes: #('Javascript-Pharo70-Extensions') ];
			package: 'Javascript-Tests-Pharo70-Extensions' with: [ spec requires: #('Javascript-Tests-Core' 'Javascript-Pharo-Core') ];
			package: 'Javascript-Tests-Pharo-Core' with: [ spec includes: #('Javascript-Tests-Pharo70-Extensions') ] ].
		
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Javascript-Core'
          with: [ spec includes: #('Javascript-GemStone-Core') ];
        package: 'Javascript-GemStone-Core'
          with: [ spec requires: #('Javascript-Core') ] ].
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinejquery: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'JQuery-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'JQuery-Tests-Core' with: [
				spec requires: #('JQuery-Core' 'Javascript-Tests-Core' 'Seaside-Development' 'Seaside-Tests-Functional' 'Seaside-Ajaxifier-Core') ];
			package: 'JQuery-Examples' with: [ 
				spec requires: #('JQuery-Core' 'Seaside-Component' 'Seaside-Examples') ];
			package: 'JQuery-JSON' with: [
				spec requires: #('JQuery-Core' 'Seaside-JSON-Core') ];
			package: 'JQuery-Tests-JSON' with: [
				spec requires: #('JQuery-JSON' 'JQuery-Tests-Core') ].
		
		spec 
			group: 'JQuery' with: #('JQuery-Core' 'JQuery-JSON');
			group: 'JQuery Tests' with: #('JQuery-Tests-Core' 'JQuery-Tests-JSON');
			group: 'Examples' with: #('JQuery-Examples');
			group: 'Tests' with: #( 'JQuery Tests' ) ]

]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinejqueryui: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'JQuery-UI' with: [
				spec requires: #('JQuery-Core' ) ];
			package: 'JQuery-Tests-UI' with: [
				spec requires: #('JQuery-UI' 'JQuery-Tests-Core' ) ].
		spec 
			group: 'JQueryUI' with: #('JQuery-UI');
			group: 'JQueryUI Tests' with: #('JQuery-Tests-UI' );
			group: 'JQueryUI Examples' with: #('JQuery-Tests-UI' );
			group: 'Tests' with: #( 'JQueryUI Tests' ) ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinejson: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ) ];
			package: 'Seaside-Tests-JSON' with: [
				spec requires: #('Seaside-JSON-Core' ) ].
		spec 
			group: 'JSON' with: #('Seaside-JSON-Core');
			group: 'JSON Tests' with: #('Seaside-Tests-JSON' );
			group: 'Tests' with: 'JSON Tests' ].
		
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec includes: #('Seaside-Pharo-JSON-Core' ) ].
		spec 
			package: 'Seaside-Pharo-JSON-Core' with: [
				spec requires: #('Seaside-JSON-Core') ].
		spec 
			package: 'Seaside-Tests-JSON' with: [
				spec includes: #('Seaside-Tests-Pharo-JSON-Core' ) ].
		spec 
			package: 'Seaside-Tests-Pharo-JSON-Core' with: [
				spec requires: #('Seaside-Tests-JSON') ] ].
		
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Seaside-JSON-Core'
          with: [ spec includes: #('Seaside-GemStone-JSON-Core') ];
        package: 'Seaside-GemStone-JSON-Core'
          with: [ spec requires: #('Seaside-JSON-Core') ] ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselineob: spec [
	spec
		for: #squeak
		do: [ spec
				project: 'OB'
				with: [ spec
						className: 'ConfigurationOfOmniBrowser';
						versionString: #stable;
						loads: #('Core');
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].

			spec package: 'Seaside-Tools-OmniBrowser' with: [ spec requires: #('OB' 'Seaside-Tools-Core') ].

			spec group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinepharo: spec [

	spec
		for: #squeakCommon
		do: [ spec
				package: 'Seaside-Canvas' with: [ spec includes: #('Seaside-Pharo-Canvas') ];
				package: 'Seaside-Development' with: [ spec includes: #('Seaside-Pharo-Development') ];
				package: 'Seaside-Email' with: [ spec includes: #('Seaside-Pharo-Email') ];
				package: 'Seaside-Environment' with: [ spec includes: #('Seaside-Pharo-Environment') ];
				package: 'Seaside-Flow' with: [ spec includes: #('Seaside-Pharo-Flow') ];
				package: 'Seaside-Tests-Development' with: [ spec includes: #('Seaside-Tests-Pharo-Development') ];
				package: 'Seaside-Tests-Flow' with: [ spec includes: #('Seaside-Tests-Pharo-Continuation') ];
				package: 'Seaside-Tests-Functional' with: [ spec includes: #('Seaside-Tests-Pharo-Functional') ];
				package: 'Seaside-Pharo-Canvas' with: [ spec requires: #('Seaside-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Pharo-Environment' with: [ spec requires: #('Seaside-Environment' 'Seaside-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Tests-Pharo-Development' with: [ spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development') ];
				package: 'Seaside-Tests-Email' with: [ spec includes: #('Seaside-Tests-Pharo-Email') ];
				package: 'Seaside-Tests-Pharo-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Email' 'Grease Core Tests') ];
				package: 'Seaside-Tests-Pharo-Functional' with: [ spec requires: #('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment') ];
				package: 'Seaside-Tests-Canvas' with: [ spec includes: #('Seaside-Tests-Pharo-Canvas') ];
				package: 'Seaside-Tests-Pharo-Canvas' with: [ spec requires: #('Seaside-Tests-Canvas') ] ].

	spec
		for: #pharo
		do: [ spec
				package: 'Seaside-Core' with: [ spec includes: #('Seaside-Pharo-Core') ];
				package: 'Seaside-Pharo-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Pharo-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Core') ];
				package: 'Seaside-Tools-Web' with: [ spec includes: #('Seaside-Pharo-Tools-Web') ];
				package: 'Seaside-Pharo-Development' with: [ spec requires: #('Seaside-Development' 'Seaside-Pharo-Tools-Web' 'Seaside-Pharo-Flow') ];
				package: 'Seaside-Pharo-Tools-Web' with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Pharo-Continuation' with: [ spec requires: #('Seaside-Core' 'Seaside-Continuation') ];
				package: 'Seaside-Pharo-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-Pharo-Continuation') ];
				package: 'Seaside-Tests-Pharo-Continuation' with: [ spec requires: #('Seaside-Pharo-Continuation') ];
				package: 'Seaside-Tests-Core' with: [ spec includes: #('Seaside-Tests-Pharo-Core') ];
				package: 'Seaside-Tests-Pharo-Core' with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core') ] ].

	spec
		for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
		do: [ spec
				package: 'Seaside-Tools-Core' with: [ spec includes: #('Seaside-Pharo-Tools-Spec') ];
				package: 'Seaside-Pharo-Tools-Spec' with: [ spec requires: #('Seaside-Tools-Core') ] ].

	spec
		for: #(#'pharo8.x' #'pharo9.x')
		do: [ spec
				package: 'Seaside-Tools-Core' with: [ spec includes: #('Seaside-Pharo-Tools-Spec2') ];
				package: 'Seaside-Pharo-Tools-Spec2' with: [ spec requires: #('Seaside-Tools-Core') ] ].
			
	spec
		for: #(#'pharo10.x' #'pharo11.x' #'pharo12.x')
		do: [ spec
				package: 'Seaside-Tools-Core' with: [ spec includes: #('Seaside-Pharo100-Tools-Spec2') ];
				package: 'Seaside-Pharo100-Tools-Spec2' with: [ spec requires: #('Seaside-Tools-Core') ] ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinerest: spec [ 

	spec for: #'common' do: [	
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ]; 
			package: 'Seaside-REST-Examples' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Canvas' 'Seaside-RenderLoop' 'Seaside-Examples') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ].
		spec 
			group: 'REST' with: #('Seaside-REST-Core');
			group: 'REST Tests' with: #('REST' 'Seaside-Tests-REST-Core')
	].


	spec for: #'squeakCommon' do: [
		spec
			package: 'Seaside-Swagger-Core' with: [ 
				spec requires: #('Seaside-REST-Core' 'Seaside-JSON-Core' 'Seaside-Component') ];
			package: 'Seaside-Tests-Swagger-Core' with: [ 
				spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec 
			group: 'REST' with: #('Seaside-REST-Core');
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].

	spec for: #(squeak) do:[
		spec
			package: 'Seaside-Squeak-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Squeak-REST-Core')];
			package: 'Seaside-Squeak-Swagger-Core';
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core' 'Seaside-Squeak-Swagger-Core') ]
	].

	spec 
		for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x') 
		do:[
			spec
				package: 'Seaside-Pharo20-REST-Core';
				package: 'Seaside-REST-Core' with:[
					spec includes: #('Seaside-Pharo20-REST-Core')];
				package: 'Seaside-Pharo-Swagger-Core';
				package: 'Seaside-Swagger-Core' with: [ 
					spec includes: #('Seaside-Pharo-Swagger-Core') ]
	].

	spec 
		for: #('pharo9.x' 'pharo10.x' 'pharo11.x' 'pharo12.x') 
		do:[
			spec
				package: 'Seaside-Pharo90-REST-Core';
				package: 'Seaside-REST-Core' with:[
					spec includes: #('Seaside-Pharo90-REST-Core')];
				package: 'Seaside-Pharo-Swagger-Core';
				package: 'Seaside-Swagger-Core' with: [ 
					spec includes: #('Seaside-Pharo-Swagger-Core') ]
	].

	spec for: #gemstone do:[
		spec
        	package: 'Seaside-GemStone-REST-Core' with: [ 
			spec requires: #('Seaside-Core') ];
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-GemStone-REST-Core')]
	].

	spec for: #'gs3.x' do:[
		spec
			package: 'Seaside-GemStone-Swagger-Core';
			package: 'Seaside-Swagger-Core'
          with: [ spec includes: #('Seaside-GemStone-Swagger-Core') ];
        package: 'Seaside-Tests-Swagger-Core'
          with: [ spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinerss: spec [

	spec for: #'common' do: [	
		spec blessing: #baseline.
		spec 
			package: 'RSS-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas') ];
			package: 'RSS-Tests-Core' with: [
				spec requires: #('RSS-Core' 'Seaside-Tests-Core') ];
			package: 'RSS-Examples' with: [
				spec requires: #('RSS-Core' 'Seaside-Tools-Core'). ].
		spec 
			group: 'RSS' with: #('RSS-Core');
			group: 'RSS Tests' with: #('RSS-Tests-Core');
			group: 'RSS Examples' with: #('RSS-Examples') ].
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinescriptaculous: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Prototype-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'Prototype-Tests-Core' with: [
				spec requires: #('Prototype-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Functional' 'Seaside-Tests-Canvas' ) ];
			package: 'Scriptaculous-Core' with: [
				spec requires: #('Prototype-Core') ];
			package: 'Scriptaculous-Tests-Core' with: [
				spec requires: #('Scriptaculous-Core' 'Prototype-Tests-Core') ];
			package: 'Scriptaculous-Components' with: [
				spec requires: #('Scriptaculous-Core' 'Seaside-Flow' 'Seaside-Widgets' 'Seaside-Component') ];
			package: 'Scriptaculous-Tests-Components' with: [
				spec requires: #('Scriptaculous-Components' 'Scriptaculous-Tests-Core') ].
		spec 
			group: 'Scriptaculous' with: #('Scriptaculous-Core' 'Scriptaculous-Components');
			group: 'Scriptaculous Tests' with: #('Prototype-Tests-Core' 'Scriptaculous-Tests-Core' 'Scriptaculous-Tests-Components');
			group: 'Tests' with: #( 'Scriptaculous Tests' ) ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinesecurity: spec [
	spec
		for: #squeakCommon
		do: [ spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ];
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security'.

			spec
				group: 'Security' with: #('Seaside-Security');
				group: 'Security Tests' with: #('Seaside-Tests-Security') ].

	spec for: #pharo do: [ spec package: 'Cryptography' with: [ spec repository: 'github://pharo-contributions/Cryptography:0.3.2/source' ] ].

	spec for: #squeak do: [ spec package: 'Cryptography' with: [ spec repository: 'http://www.squeaksource.com/Cryptography' ] ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselineslime: spec [

	spec
		for: #pharo
		do: [ 
			spec
				project: 'Grease Slime' copyFrom: 'Grease' with: [ spec loads: #('Slime') ];
				project: 'Grease Slime Tests' copyFrom: 'Grease' with: [ spec loads: #('Slime Tests') ] ].

	spec
		for: #(#'pharo8.x' #'pharo9.x')
		do: [ 
			spec
				package: 'Seaside-Pharo-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Pharo-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Pharo-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ].
			
	spec
		for: #(#'pharo10.x' #'pharo11.x' #'pharo12.x')
		do: [ 
			spec
				package: 'Seaside-Pharo110-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Pharo110-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Pharo110-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinesqueak: spec [

	"Mind that baselinepharo still has a squeakcommon section!"
	spec
		for: #squeak
		do: [ 
			spec
				package: 'Seaside-Squeak-Compatibility';
				package: 'Seaside-Squeak-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Core' with:[ spec includes: #('Seaside-Squeak-Core' 'Seaside-Squeak-Compatibility' ) ];
				package: 'Seaside-Tools-Web' with: [ spec includes: #('Seaside-Squeak-Tools-Web') ];
				package: 'Seaside-Pharo-Development' with: [ spec requires: #('Seaside-Development' 'Seaside-Squeak-Tools-Web' 'Seaside-Pharo-Flow') ];
				package: 'Seaside-Squeak-Tools-Web' with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Squeak-Continuation' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Pharo-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-Squeak-Continuation') ];
				package: 'Seaside-Tests-Pharo-Continuation' with: [ spec requires: #('Seaside-Squeak-Continuation') ];

				package: 'Seaside-Tests-Core' with: [ spec includes: #('Seaside-Tests-Squeak-Core') ];
				package: 'Seaside-Tests-Squeak-Core' with: [ spec requires: #('Seaside-Squeak-Core' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Pharo-Functional' with: [ spec requires: #('Seaside-Tests-Squeak-Core') ];
				package: 'Seaside-Pharo-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Squeak-Core') ];
				
				"ToolBuilder based tools"
				package: 'Seaside-Tools-Core' with: [ spec includes: #('Seaside-Squeak-Tools-Development') ];
				package: 'Seaside-Squeak-Tools-Development'  with: [ spec requires: #('Seaside-Tools-Core') ]  ]
]

{ #category : 'baselines' }
BaselineOfSeaside3 >> baselinewelcome: spec [

	spec for: #common do: [

		spec 
			package: 'Seaside-Welcome' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Widgets' 'Seaside-Examples' 'Seaside-Development' 'Seaside-Flow' 'Seaside-Tests-Flow' 'JQuery-Core' 'JQuery-UI') ];
			package: 'Seaside-Tests-Welcome' with: [
				spec requires: #('Seaside-Welcome' ) ].
		spec 
			group: 'Welcome' with: #('Seaside-Welcome' 'JQueryUI Tests');
			group: 'Welcome Tests' with: #('Seaside-Tests-Welcome') ].	
			
	spec for: #'squeak' do: [
		spec 
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-Squeak-Welcome' ). ];
			package: 'Seaside-Squeak-Welcome' with: [
				spec 
					requires: #('Seaside-Welcome' 'WebClient');
					postLoadDoIt: #startWelcomeSeasideAdaptorInSqueak ]. 
		spec
			group: 'default' with: #( 'Welcome' 'Seaside-Examples');
			group: 'OneClick' with: #('Development' 'Welcome' 'RSS-Examples' 'Seaside-Email' 'Seaside-Examples' 'Seaside-Tools-Web' 'WebClient') ].

	spec for: #'pharo' do: [
		spec 
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-Pharo-Welcome' ). ];
			package: 'Seaside-Pharo-Welcome' with: [
				spec 
					requires: #('Seaside-Welcome' 'Zinc');
					postLoadDoIt: #startWelcomeSeasideAdaptorInPharo. ].
		
		spec
			group: 'default' with: #( 'Welcome' 'Seaside-Examples');
			group: 'OneClick' with: #('Development' 'Welcome' 'RSS-Examples' 'Seaside-Email' 'Seaside-Examples' 'Seaside-Tools-Web' 'Zinc') ].
		
	spec for: #'gs3.x' do: [
		spec
			package: 'Seaside-GemStone-Welcome';
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-GemStone-Welcome' ) ] ].
]

{ #category : 'accessing' }
BaselineOfSeaside3 >> projectClass [
  Smalltalk at: #'MetacelloCypressBaselineProject' ifPresent: [ :cl | ^ cl ].
  ^ super projectClass
]

{ #category : 'doits' }
BaselineOfSeaside3 >> startWelcomeSeasideAdaptorInPharo [
	(Smalltalk globals at: #WAAdmin) defaultServerManager adaptors
		ifEmpty: [ (Smalltalk globals includesKey: #ZnZincServerAdaptor)
				ifTrue: [ (Smalltalk globals at: #ZnZincServerAdaptor) startOn: 8080 ] ]
]

{ #category : 'doits' }
BaselineOfSeaside3 >> startWelcomeSeasideAdaptorInSqueak [
	(Smalltalk globals at: #WAAdmin) defaultServerManager adaptors
		ifEmpty: [ (Smalltalk globals includesKey: #WAWebServerAdaptor)
				ifTrue: [ ((Smalltalk globals at: #WAWebServerAdaptor) port: 8080)
						codec: ((Smalltalk globals at: #GRCodec) forEncoding: 'utf-8');
						start ] ]
]
