Class {
	#name : #BaselineOfSeaside3,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSeaside3'
}

{ #category : #baselines }
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

{ #category : #baselines }
BaselineOfSeaside3 >> baselineadaptors: spec [
  spec
    for: #'common'
    do: [ 
      spec
        project: 'Swazoo2'
        with: [ 
          spec
            versionString: #'stable';
            className: 'ConfigurationOfSwazoo2';
            loads: #('Swazoo');
            repository: 'http://smalltalkhub.com/mc/Swazoo/Swazoo/main' ].
      spec
        package: 'Seaside-Swazoo'
          with: [ 
              spec
                requires: #('Grease' 'Swazoo2');
                repository:
                    'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
        package: 'Seaside-Adaptors-Swazoo'
          with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
      spec
        group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo');
        yourself ].

	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'WebClient Project'
				with: [ 
					spec
						versionString: '1.5';
						className: 'ConfigurationOfWebClient';
						loads: #('Core');
						repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].
			spec
				package: 'WebClient-Seaside'
				with: [ 
					spec repository: 'http://ss3.gemtalksystems.com/ss/WebClient'.
					spec requires: #('WebClient Project' 'Seaside-Core') ].
			spec
				group: 'WebClient' with: #('WebClient-Seaside') ].
			
	spec
		for: #(#squeak #'pharo1.x')
		do: [ spec package: 'WebClient-Seaside' with: [ spec requires: #('OB' 'Seaside-Tools-OmniBrowser') ] ].
		
	spec
		for: #pharo
		do: [
                  spec
                    package: 'Zinc-Seaside'
                    with: [ spec requires: #('Zinc Project' 'Seaside-Core') ].
			spec
				project: 'Zinc Project'
				with: [ 
					spec
						versionString: #stable;
						loads: 'Zinc-HTTP';
						className: 'ConfigurationOfZincHTTPComponents';
						repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
			spec
				package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
				package: 'Zinc-Seaside'
					with: [ 
							spec
								repository: 'http://mc.stfx.eu/ZincHTTPComponents';
								requires: #('Zinc Project' 'Seaside-Core') ];
				package: 'KomHttpServerLight'
					with: [ spec repository: 'http://www.smalltalkhub.com/mc/Seaside/KomHttpServer/main' ];
				package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Adaptors-Comanche') ].
			spec
				group: 'Kom' with: #('Seaside-Adaptors-Comanche');
				group: 'Zinc' with: #('Zinc-Seaside');
				group: 'Comanche' with: #('Seaside-Adaptors-Comanche') ].
			
	spec
		for: #'pharo1.x'
		do: [ spec package: 'Seaside-Tests-Adaptors-Comanche' with: [ spec requires: #('Seaside-Tests-Pharo-Core') ] ].
		
	spec
		for: #gemstone
		do: [ 
			spec
            package: 'Zinc-Seaside'
            with: [ spec requires: #('Zinc Project' 'Seaside-Core') ].

			spec
				project: 'FastCGI Project'
					with: [ 
							spec
								className: 'ConfigurationOfGsFastCGI';
								versionString: #stable;
								loads: #('FastCGI');
								repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
				baseline: 'GsApplicationTools'
					with: [ 
							spec
								loads: 'Core';
								repository: 'github://GsDevKit/gsApplicationTools:v1.?/repository' ];
				baseline: 'Zinc Project'
					with: [ 
							spec
								className: 'BaselineOfZincHTTPComponents';
								loads: #('Core');
								repository: 'github://GsDevKit/zinc:v2.4.3.?/repository' ];
				yourself.
			spec
				package: 'Seaside-GemStone-GemServer-Core' with: [ spec requires: #('GsApplicationTools' 'Seaside-Core') ];
				package: 'Seaside-GemStone-GemServer-Tests'
					with: [ 
							spec
								requires:
									#('Seaside-GemStone-GemServer-Core' 'Seaside-GemStone-Development' 'Seaside-GemStone-Adaptors-Swazoo' 'Seaside-GemStone-Adaptors-Zinc' 'Seaside-Adaptors-FastCGI') ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
				package: 'Zinc-Seaside' with: [ spec includes: #('Seaside-GemStone-Adaptors-Zinc') ];
				package: 'Seaside-Adaptors-FastCGI'
					with: [ spec requires: #('Seaside-Core' 'FastCGI Project' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-GemStone-Adaptors-Swazoo'
					with: [ spec requires: #('Seaside-Adaptors-Swazoo' 'Seaside-GemStone-GemServer-Core') ];
				package: 'Seaside-GemStone-Adaptors-Zinc'
					with: [ spec requires: #('Zinc-Seaside' 'Seaside-GemStone-GemServer-Core') ].
			spec
				group: 'FastCGI' with: #('Seaside-Adaptors-FastCGI');
				group: 'Tests' with: #('Seaside-GemStone-GemServer-Tests');
				group: 'Zinc' with: #('Zinc-Seaside');
				yourself ]
]

{ #category : #baselines }
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

{ #category : #baselines }
BaselineOfSeaside3 >> baselinecommon: spec [

	spec for: #'squeakCommon' do: [ 
      spec
			baseline: 'Grease'
        	with: [ 
				spec
					loads: #('Grease-Core');
					repository: 'github://SeasideSt/Grease:master/repository' ].
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
			package: 'Seaside-Canvas' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Component' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Core' with: [
				spec requires: #('Grease' ). ];
			package: 'Seaside-Development' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Flow'). ];
			package: 'Seaside-Email' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Environment' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Widgets' ). ];
			package: 'Seaside-Examples' with: [
				spec requires: #('Seaside-Component' 'Seaside-Canvas' 'Seaside-Tools-Core' ). ];
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
				spec requires: #('Seaside-Tools-Core' 'Seaside-RenderLoop' 'Seaside-Widgets' ). ];
			package: 'Seaside-Widgets' with: [
				spec requires: #('Seaside-Component' 'Seaside-Canvas' ). ];
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
				spec requires: #('Seaside-Environment' 'Seaside-Tests-Core' 'Seaside-Widgets' ). ];
			package: 'Seaside-Tests-InternetExplorer' with: [
				spec requires: #('Seaside-InternetExplorer' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-RenderLoop' with: [
				spec requires: #('Seaside-RenderLoop' 'Seaside-Tests-Session' ). ];
			package: 'Seaside-Tests-Session' with: [
				spec requires: #('Seaside-Tests-Core' 'Seaside-Session' 'Seaside-Tests-Canvas'). ];
			package: 'Seaside-Tests-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-UTF8' with: [
				spec requires: #('Seaside-Tests-Core' ) ].
		spec 
			group: 'default' with: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'JQueryUI' 'Seaside-Examples' 'Seaside-Welcome');
			group: 'OneClick' with: #('Tests' 'Development' 'Zinc');
			group: 'CI' with: #('Tests' 'Development Tests');
			group: 'Core' with: #('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Flow' 'Seaside-Environment' 'Seaside-Widgets' );
			group: 'Tests' with: #('Core' 'Seaside-Tests-Core' 'Seaside-Tests-Canvas' 'Seaside-Tests-Session' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop' 'Seaside-Tests-Environment' 'Seaside-Tests-Flow' 'Seaside-Tests-UTF8' 'Seaside-Tests-InternetExplorer' 'Seaside-Tests-Email' 'Seaside-Tests-Examples' 'RSS Tests' 'Welcome Tests' 'REST Tests' 'Swagger Tests');
			group: 'Development' with: #('Core' 'Seaside-Development' );
			group: 'Development Tests' with: #('Development' 'Core' 'Seaside-Tests-Development' );
			group: 'Email' with: #('Seaside-Email');
			group: 'Examples' with: #('Core' 'Seaside-Examples' );
			group: 'Base' with: #('Core')  ].
]

{ #category : #baselines }
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

{ #category : #baselines }
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
                repository: 'github://glassdb/glass:master/repository' ];
        yourself.
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
        package: 'Seaside-GemStone-Continuation';
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
        group: 'CI' with: #('FastCGI' 'Zinc' 'Swazoo');
        group: 'Development' with: #('Seaside-GemStone-Basic-Development');
        group: 'Production' with: #('Seaside-GemStone-Tools-Production') ].
  spec
    for: #'gs2.4.x'
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone240-Core') ];
        package: 'Seaside-GemStone240-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone240-Core') ];
        package: 'Seaside-GemStone-Flow'
          with: [ spec includes: #('Seaside-GemStone240-Flow') ];
        package: 'Seaside-GemStone240-Flow'
          with: [ spec requires: #('Seaside-GemStone-Flow') ];
        yourself.
      spec
        removePackage: 'Seaside-Examples';
        removePackage: 'Seaside-Tests-Examples'.
      spec
        group: 'Seaside-Examples' with: #();
        group: 'Seaside-Tests-Examples' with: #() ].
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
    for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x')
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
          with: [ spec requires: #('Seaside-GemStone320-Core') ] ]
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinegettext: spec [

	spec for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x' #'pharo4.x') do:[
		spec
			project: 'Gettext-Project'
			with: [	spec
						className: 'ConfigurationOfGettext';
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Gettext/main' ].
				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Gettext-Project' 'Seaside-Session') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Gettext-Core') ];
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[ spec includes: 'Seaside-Pharo-Gettext-Core' ].
		
		spec
			group: 'Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Gettext' 'Seaside-Gettext-Examples');
			group: 'CI' with: #('Gettext' 'Gettext-Examples').
	].

	spec for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x') do:[
		spec
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Slime') ].
			
		spec 
			group: 'Gettext-Slime' with: #('Seaside-Gettext-Slime')
	].

	spec for: #(#'pharo4.x') do:[
		spec
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo40-Slime') ].
			
		spec 
			group: 'Gettext-Slime' with: #('Seaside-Gettext-Slime')
	]
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinejavascript: spec [

	spec for: #'common' do: [

		spec 
			package: 'Javascript-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ) ];
			package: 'Javascript-Tests-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Tests-Core' ) ].
		spec 
			group: 'Javascript' with: #('Javascript-Core');
			group: 'Javascript Tests' with: #('Javascript-Tests-Core' );
			group: 'Tests' with: #( 'Javascript Tests' ) ].
		
	spec for: #(squeak #'pharo1.x') do: [
		spec 
			package: 'Javascript-Pharo-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Pharo-Core' ) ].
		spec 
			package: 'Javascript-Tests-Pharo-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Javascript-Pharo-Core' ) ].
		spec 
			package: 'Javascript-Core' with: [
				spec includes: #('Javascript-Pharo-Core' ) ];
			package: 'Javascript-Tests-Core' with: [
				spec includes: #('Javascript-Tests-Pharo-Core' ) ] ].
		
	spec for: #(#'pharo2.x' #'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x') do: [
		spec 
			package: 'Javascript-Pharo20-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Pharo20-Core' ) ].
		spec 
			package: 'Javascript-Tests-Pharo-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Javascript-Pharo20-Core' ) ].
		spec 
			package: 'Javascript-Core' with: [
				spec includes: #('Javascript-Pharo20-Core' ) ];
			package: 'Javascript-Tests-Core' with: [
				spec includes: #('Javascript-Tests-Pharo-Core' ) ] ].
		
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Javascript-Core'
          with: [ spec includes: #('Javascript-GemStone-Core') ];
        package: 'Javascript-GemStone-Core'
          with: [ spec requires: #('Javascript-Core') ] ].
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinejquery: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'JQuery-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'JQuery-Tests-Core' with: [
				spec requires: #('JQuery-Core' 'Javascript-Tests-Core' 'Seaside-Development' 'Seaside-Tests-Functional') ];
			package: 'JQuery-JSON' with: [
				spec requires: #('JQuery-Core' 'Seaside-JSON-Core') ];
			package: 'JQuery-Tests-JSON' with: [
				spec requires: #('JQuery-JSON' 'JQuery-Tests-Core') ].
		
		spec 
			group: 'JQuery' with: #('JQuery-Core' 'JQuery-JSON');
			group: 'JQuery Tests' with: #('JQuery-Tests-Core' 'JQuery-Tests-JSON');
			group: 'Tests' with: #( 'JQuery Tests' ) ]
]

{ #category : #baselines }
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

{ #category : #baselines }
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

{ #category : #baselines }
BaselineOfSeaside3 >> baselineob: spec [

    spec
        for: #'pharo1.x'
        do: [ 
            spec blessing: #'baseline'.
            spec
                project: 'OB'
                with: [ 
                    spec
                        className: 'ConfigurationOfOmniBrowser';
                        versionString: #'stable';
                        loads: #('Core');
                        repository: 'http://www.squeaksource.com/MetacelloRepository' ].
            spec package: 'Seaside-Pharo-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-OmniBrowser') ].
            spec
                package: 'Seaside-Tools-OmniBrowser'
                with: [ 
                    spec
                        requires: #('OB' 'Seaside-Tools-Core');
                        includes: #('Seaside-Pharo-Tools-OmniBrowser') ].
            spec group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ].
    spec
        for: #'squeak'
        do: [ 
            spec blessing: #'baseline'.
            spec
                project: 'OB'
                with: [ 
                    spec
                        className: 'ConfigurationOfOmniBrowser';
                        versionString: #'stable';
                        loads: #('Core');
                        repository: 'http://www.squeaksource.com/MetacelloRepository' ].
            spec package: 'Seaside-Pharo-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-OmniBrowser') ].
            spec
                package: 'Seaside-Tools-OmniBrowser'
                with: [ 
                    spec
                        requires: #('OB' 'Seaside-Tools-Core');
                        includes: #('Seaside-Pharo-Tools-OmniBrowser') ].
            spec group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ].
    spec
        for: #'pharo1.3.x'
        do: [ 
            spec
                project: 'OB'
                with: [ 
                    spec
                        className: 'ConfigurationOfOmniBrowserLukas';
                        versionString: #'stable';
                        loads: #('default');
                        repository: 'http://www.squeaksource.com/MetacelloRepository' ] ].

	"spec for: #'gemstone' do: [
		spec blessing: #baseline.
		spec
			project: 'OB' with: [
				spec
					className: 'ConfigurationOfGsOB';
					versionString: #'stable';
					repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ].
		spec
			package: 'Seaside-Tools-OmniBrowser' with: [
				spec 
					requires: #('OB' 'Seaside-Tools-Core');
					includes: #('Seaside-GemStone-Tools-OmniBrowser' ) ].
		spec
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: [
				spec requires: #('Seaside-Tools-OmniBrowser') ].
		spec 
			 group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ]"
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinepharo: spec [

	spec for: #'squeakCommon' do: [

		spec
			package: 'Seaside-Canvas' with: [
				spec includes: #('Seaside-Pharo-Canvas' ). ];
			package: 'Seaside-Development' with: [
				spec includes: #('Seaside-Pharo-Development' ). ];
			package: 'Seaside-Email' with: [
				spec includes: #('Seaside-Pharo-Email' ). ];
			package: 'Seaside-Environment' with: [
				spec includes: #('Seaside-Pharo-Environment' ). ];
			package: 'Seaside-Flow' with: [
				spec includes: #('Seaside-Pharo-Flow' ). ];
			package: 'Seaside-Tests-Development' with: [
				spec includes: #('Seaside-Tests-Pharo-Development' ). ];
			package: 'Seaside-Tests-Flow' with: [
				spec includes: #('Seaside-Tests-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Functional' with: [
				spec includes: #('Seaside-Tests-Pharo-Functional' ). ];
			package: 'Seaside-Pharo-Canvas' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ). ];

			package: 'Seaside-Pharo-Environment' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Core' 'Seaside-Canvas' ). ];
			package: 'Seaside-Tests-Pharo-Development' with: [
				spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development' ). ];
			package: 'Seaside-Tests-Email' with: [ 
				 spec includes: #('Seaside-Tests-Pharo-Email'). ];
			package: 'Seaside-Tests-Pharo-Email' with: [
				spec requires: #('Seaside-Email' 'Seaside-Pharo-Email' 'Grease Core Tests'). ];
			package: 'Seaside-Tests-Pharo-Functional' with: [
				spec requires: #('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment') ];
			package: 'Seaside-Tests-Canvas' with: [
				spec includes: #('Seaside-Tests-Pharo-Canvas' ). ];
			package: 'Seaside-Tests-Pharo-Canvas' with: [
				spec requires: #('Seaside-Tests-Canvas' ). ] ].
				
    spec for: #(#'squeak' #'pharo1.x')  do: [ 
    	spec
			package: 'Seaside-Tools-Web' with: [
				spec includes: #('Seaside-Pharo-Tools-Web') ];
			package: 'Seaside-Pharo-Development' with: [
				spec requires: #('Seaside-Development' 'Seaside-Pharo-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
			package: 'Seaside-Pharo-Continuation' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Pharo-Flow' with: [
				spec requires: #('Seaside-Flow' 'Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Pharo-Continuation' with: [
				spec requires: #('Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Core' with: [
				spec includes: #('Seaside-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Core' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Tests-Core' with: [
				spec includes: #('Seaside-Tests-Pharo-Core' ) ];
			package: 'Seaside-Tests-Pharo-Core' with: [
				spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core' ) ];
			package: 'Seaside-Tests-Pharo-Functional' with: [
				spec requires: #( 'Seaside-Tests-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Email' with: [
				spec requires: #('Seaside-Email' 'Seaside-Pharo-Core' ) ] ].
		
	spec for: #'pharo2.x' do: [
		spec
			package: 'Seaside-Tools-Web' with: [
				spec includes: #('Seaside-Pharo20-Tools-Web') ];
			package: 'Seaside-Pharo-Development'  with: [
				spec requires: #('Seaside-Development' 'Seaside-Pharo20-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo20-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
			package: 'Seaside-Pharo-Continuation' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Pharo-Flow' with: [
				spec requires: #('Seaside-Flow' 'Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Pharo-Continuation' with: [
				spec requires: #('Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Core' with: [
				spec includes: #('Seaside-Pharo20-Core' ) ];
			package: 'Seaside-Pharo20-Core' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Tests-Core' with: [
				spec includes: #('Seaside-Tests-Pharo20-Core' ) ];
			package: 'Seaside-Tests-Pharo20-Core' with: [
				spec requires: #('Seaside-Pharo20-Core' 'Seaside-Tests-Core' ) ];
			package: 'Seaside-Pharo-Email' with: [
				spec requires: #('Seaside-Email' 'Seaside-Pharo20-Core' ) ] ].

	spec for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x') do: [
		spec 
			package: 'Seaside-Core' with: [
				spec includes: #('Seaside-Pharo20-Core' ) ];
			package: 'Seaside-Pharo20-Core' with: [
				spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Pharo-Email' with: [
				spec requires: #('Seaside-Email' 'Seaside-Pharo20-Core' ) ] ].
		
	spec for: #'pharo3.x' do: [
      spec
			package: 'Seaside-Tools-Web' with: [
				spec includes: #('Seaside-Pharo20-Tools-Web') ];
			package: 'Seaside-Pharo-Development' with: [
				spec requires: #('Seaside-Development' 'Seaside-Pharo20-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo20-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
			package: 'Seaside-Pharo-Continuation' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Pharo-Flow' with: [
				spec requires: #('Seaside-Flow' 'Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Pharo-Continuation' with: [
				spec requires: #('Seaside-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Core' with: [
				spec includes: #('Seaside-Tests-Pharo20-Core' ) ];
			package: 'Seaside-Tests-Pharo20-Core' with: [
				spec requires: #('Seaside-Pharo20-Core' 'Seaside-Tests-Core' ) ]].
		
	spec for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x') do: [
       spec
			package: 'Seaside-Tools-Web' with: [
				spec includes: #('Seaside-Pharo50-Tools-Web') ];
			package: 'Seaside-Pharo-Development' with: [
				spec requires: #('Seaside-Development' 'Seaside-Pharo50-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo50-Tools-Web' with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
			package: 'Seaside-Pharo40-Continuation' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Pharo-Flow' with: [
				spec requires: #('Seaside-Flow' 'Seaside-Pharo40-Continuation' ). ];
			package: 'Seaside-Tests-Pharo-Continuation' with: [
				spec requires: #('Seaside-Pharo40-Continuation' ). ];
			package: 'Seaside-Tests-Core' with: [
				spec includes: #('Seaside-Tests-Pharo40-Core' ) ];
			package: 'Seaside-Tests-Pharo40-Core' with: [
				spec requires: #('Seaside-Pharo20-Core' 'Seaside-Tests-Core' ) ]].
		
	"Spec based tools"
	spec for: #(#'pharo2.x' #'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x') do: [
		spec
			package: 'Seaside-Tools-Core' with: [
				spec includes: #('Seaside-Pharo-Tools-Spec') ];
			package: 'Seaside-Pharo-Tools-Spec'  with: [
				spec requires: #('Seaside-Tools-Core') ] ].
		
	"ToolBuilder based tools"
	spec for: #(#'squeak4.6.x' #'squeak5.x') do: [
		spec
			package: 'Seaside-Tools-Core' with: [
				spec includes: #('Seaside-Squeak-Tools-Development') ];
			package: 'Seaside-Squeak-Tools-Development'  with: [
				spec requires: #('Seaside-Tools-Core') ] ].
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinerest: spec [ 

	spec for: #'common' do: [	
		spec 
			package: 'Seaside-REST-Core' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-REST-Core' with: [
				spec requires: #('Seaside-REST-Core' 'Seaside-Tests-Core') ].
		spec 
			group: 'REST' with: #('Core' 'Seaside-REST-Core');
			group: 'REST Tests' with: #('REST' 'Seaside-Tests-REST-Core')
	].


	spec for: #'squeakCommon' do: [
		spec
			package: 'Seaside-Swagger-Core' with: [ 
				spec requires: #('Seaside-REST-Core' 'Seaside-JSON-Core' 'Seaside-Component') ];
			package: 'Seaside-Tests-Swagger-Core' with: [ 
				spec requires: #('Seaside-Tests-REST-Core' 'Seaside-Swagger-Core') ].
		spec
			group: 'Swagger' with: #('REST' 'Seaside-Swagger-Core');
			group: 'Swagger Tests' with: #('Swagger' 'Seaside-Tests-Swagger-Core')
	].

	spec for: #(squeak 'pharo1.x') do:[
		spec
			package: 'Seaside-Pharo-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo-REST-Core')];
			package: 'Seaside-Squeak-Swagger-Core';
			package: 'Seaside-Pharo-Swagger-Core';
			package: 'Seaside-Swagger-Core' with: [ 
				spec includes: #('Seaside-Pharo-Swagger-Core' 'Seaside-Squeak-Swagger-Core') ]
	].

	spec for: #('pharo2.x' 'pharo3.x' 'pharo4.x' 'pharo5.x' #'pharo6.x' #'pharo7.x') do:[
		spec
			package: 'Seaside-Pharo20-REST-Core';
			package: 'Seaside-REST-Core' with:[
				spec includes: #('Seaside-Pharo20-REST-Core')];
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

	spec for: #'gs2.4.x' do: [
		spec
			group: 'Swagger' with: #('REST');
			group: 'Swagger Tests' with: #('Swagger')
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

{ #category : #baselines }
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

{ #category : #baselines }
BaselineOfSeaside3 >> baselinescriptaculous: spec [

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Prototype-Core' with: [
				spec requires: #('Javascript-Core' ) ];
			package: 'Prototype-Tests-Core' with: [
				spec requires: #('Prototype-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Functional') ];
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

{ #category : #baselines }
BaselineOfSeaside3 >> baselinesecurity: spec [
	spec
		for: #pharo
		do: [ spec package: 'Cryptography' with: [ spec repository: 'http://mc.smalltalkhub.com/mc/Cryptography/Cryptography/main' ].
			spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ].
			spec
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security' ].
	spec
		for: #squeak
		do: [ spec package: 'Cryptography' with: [ spec repository: 'http://www.squeaksource.com/Cryptography' ].
			spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ].
			spec
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security' ].
	spec
		for: #squeakCommon
		do: [ spec
				group: 'Security' with: #('Seaside-Security');
				group: 'Security Tests' with: #('Seaside-Tests-Security') ]
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselineslime: spec [

	spec for: #'squeakCommon' do: [
		spec 
			project: 'Grease Slime' copyFrom: 'Grease' with: [
				spec loads: #('Slime' ) ];
			project: 'Grease Slime Tests' copyFrom: 'Grease' with: [
				spec loads: #('Slime Tests' ) ].
		].
		
	 spec for: #(#'squeak' #'pharo1.x' #'pharo2.x' #'pharo3.x') do: [	
		spec
			package: 'Seaside-Slime' with: [
				spec requires: #('Grease Slime' ). ];
			package: 'Seaside-Tests-Slime' with: [
				spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests' ). ]. 

		spec 
			group: 'Development' with: #('Seaside-Slime' );
			group: 'Development Tests' with: #('Seaside-Tests-Slime' ) 
	].

	 spec for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x') do: [	
		spec
			package: 'Seaside-Pharo40-Slime' with: [
				spec requires: #('Grease Slime' ). ];
			package: 'Seaside-Tests-Slime' with: [
				spec requires: #('Seaside-Pharo40-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests' ). ]. 

		spec 
			group: 'Development' with: #('Seaside-Pharo40-Slime' );
			group: 'Development Tests' with: #('Seaside-Tests-Slime' ) 
	].
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinesqueak: spec [

	spec for: #squeak do: [

		spec 
			package: 'Seaside-Squeak-Compatibility';
			package: 'Seaside-Core' with:[ spec includes: #('Seaside-Squeak-Compatibility' ). ]
		].
	
	"ToolBuilder based tools"
	spec for: #(#'squeak4.6.x' #'squeak5.x') do: [
		spec
			package: 'Seaside-Tools-Core' with: [
				spec includes: #('Seaside-Squeak-Tools-Development') ];
			package: 'Seaside-Squeak-Tools-Development'  with: [
				spec requires: #('Seaside-Tools-Core') ] 
		].
]

{ #category : #baselines }
BaselineOfSeaside3 >> baselinewelcome: spec [

	spec for: #(#'squeakCommon' #'gs3.x') do: [

		spec 
			package: 'Seaside-Welcome' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Widgets' 'Seaside-Examples' 'Seaside-Development' 'Seaside-Flow' 'Seaside-Tests-Flow' 'JQuery-Core' 'JQuery-UI' 'JQuery-Tests-Core' 'JQuery-Tests-UI') ];
			package: 'Seaside-Tests-Welcome' with: [
				spec requires: #('Seaside-Welcome' ) ].
		spec 
			group: 'Welcome' with: #('Seaside-Welcome');
			group: 'Welcome Tests' with: #('Seaside-Tests-Welcome');
			group: 'Welcome' with: #( 'Welcome Tests' ) ].		
	
  spec
    for: #'gs2.4.x'
    do: [
		spec
			group: 'Welcome Tests'  with: #() ].

	spec for: #'squeak' do: [
		spec 
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-Squeak-Welcome' ). ];
			package: 'Seaside-Squeak-Welcome' with: [
				spec requires: #('Seaside-Welcome' ). ]. 
		spec
			group: 'OneClick' with: #('Development' 'Welcome' 'RSS-Examples' 'Seaside-Email' 'Seaside-Examples' 'Seaside-Tools-Web' 'WebClient') ].

	spec for: #'pharo' do: [
		spec 
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-Pharo-Welcome' ). ];
			package: 'Seaside-Pharo-Welcome' with: [
				spec requires: #('Seaside-Welcome' ) ].
		spec
			group: 'default' with: #( 'Welcome' 'Seaside-Examples' 'Zinc' );
			group: 'OneClick' with: #('Development' 'Welcome' 'RSS-Examples' 'Seaside-Email' 'Seaside-Examples' 'Seaside-Tools-Web' 'Zinc') ].

	spec for: #'pharo1.x' do: [
		spec
			group: 'OneClick' with: #('Comet Examples' 'Seaside-Tools-OmniBrowser' 'Kom') ].
		
	spec for: #'gs3.x' do: [
		spec
			package: 'Seaside-GemStone-Welcome';
			package: 'Seaside-Welcome' with: [
				spec includes: #('Seaside-GemStone-Welcome' ) ] ].
]
