baselines-30
baseline3016commonBaseline: spec
	<version: '3.0.16-baseline-commonBaseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: ''.
			spec repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30/main'.
			spec
				project: 'Grease Core'
					with: [ 
							spec
								className: 'ConfigurationOfGrease';
								versionString: #'release1.1';
								loads: #('Core');
								repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
				project: 'Grease Core Tests' copyFrom: 'Grease Core' with: [ spec loads: #('Core Tests') ];
				project: 'Swazoo2'
					with: [ 
							spec
								className: 'ConfigurationOfSwazoo2';
								versionString: #stable;
								repository: 'http://www.smalltalkhub.com/mc/Swazoo/Swazoo/main' ];
				project: 'Zinc'
					with: [ 
							spec
								className: 'ConfigurationOfZincHTTPComponents';
								versionString: #stable;
								repository: 'http://mc.stfx.eu/ZincHTTPComponents' ];
				package: 'Seaside-FileSystem'
					with: [ 
							spec
								requires: #('Seaside-Core');
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Seaside-Tests-FileSystem'
					with: [ 
							spec
								requires: #('Seaside-FileSystem');
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ].
			spec
				package: 'Javascript-Core' with: [ spec requires: #('Seaside-Core' 'Seaside-Canvas') ];
				package: 'JQuery-Core' with: [ spec requires: #('Javascript-Core') ];
				package: 'JQuery-UI' with: [ spec requires: #('JQuery-Core') ];
				package: 'Prototype-Core' with: [ spec requires: #('Javascript-Core') ];
				package: 'RSS-Core' with: [ spec requires: #('Seaside-Canvas') ];
				package: 'RSS-Examples' with: [ spec requires: #('RSS-Core' 'Seaside-Tools-Core') ];
				package: 'Scriptaculous-Core' with: [ spec requires: #('Prototype-Core') ];
				package: 'Scriptaculous-Components'
					with: [ spec requires: #('Scriptaculous-Core' 'Seaside-Component' 'Seaside-Flow' 'Seaside-Widgets') ];
				package: 'Seaside-Canvas' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Component' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Core'
					with: [ 
							spec
								postLoadDoIt: #seaside304DoIts;
								requires: #('Grease Core') ];
				package: 'Seaside-Development' with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Flow' 'Seaside-Environment') ];
				package: 'Seaside-Email' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Environment'
					with: [ 
							spec
								requires:
									#('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Widgets') ];
				package: 'Seaside-Examples' with: [ spec requires: #('Seaside-Component' 'Seaside-Canvas' 'Seaside-Tools-Core') ];
				package: 'Seaside-Flow'
					with: [ spec requires: #('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core') ];
				package: 'Seaside-HTML5' with: [ spec requires: #('Seaside-Canvas') ];
				package: 'Seaside-InternetExplorer' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-RenderLoop' with: [ spec requires: #('Seaside-Component' 'Seaside-Session') ];
				package: 'Seaside-Session' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Tools-Core'
					with: [ spec requires: #('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Session') ];
				package: 'Seaside-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-Core') ];
				package: 'Seaside-Tools-Web'
					with: [ spec requires: #('Seaside-Tools-Core' 'Seaside-RenderLoop' 'Seaside-Widgets') ];
				package: 'Seaside-Welcome'
					with: [ 
							spec
								requires:
									#('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Examples' 'Seaside-Development' 'JQuery-Core' 'JQuery-UI' 'Seaside-Flow' 'Seaside-Tests-Flow' 'Seaside-Widgets') ];
				package: 'Seaside-Widgets' with: [ spec requires: #('Seaside-Component' 'Seaside-Canvas') ];
				package: 'Seaside-Swazoo'
					with: [ 
							spec
								requires: #('Grease Core' 'Swazoo2');
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Zinc-Seaside'
					with: [ 
							spec
								requires: #('Seaside-Core' 'Zinc');
								repository: 'http://mc.stfx.eu/ZincHTTPComponents' ];
				package: 'Seaside-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ];
				package: 'Javascript-Tests-Core' with: [ spec requires: #('Seaside-Tests-Core' 'Javascript-Core') ];
				package: 'JQuery-Tests-Core'
					with: [ spec requires: #('JQuery-Core' 'Javascript-Tests-Core' 'Seaside-Development' 'Seaside-Tests-Functional') ];
				package: 'JQuery-Tests-UI' with: [ spec requires: #('JQuery-UI' 'JQuery-Tests-Core') ];
				package: 'Prototype-Tests-Core'
					with: [ spec requires: #('Prototype-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Functional') ];
				package: 'RSS-Tests-Core' with: [ spec requires: #('RSS-Core' 'Seaside-Tests-Core') ];
				package: 'Scriptaculous-Tests-Core' with: [ spec requires: #('Scriptaculous-Core' 'Prototype-Tests-Core') ];
				package: 'Scriptaculous-Tests-Components'
					with: [ spec requires: #('Scriptaculous-Components' 'Scriptaculous-Tests-Core') ];
				package: 'Seaside-Tests-Canvas' with: [ spec requires: #('Seaside-Tests-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Tests-Component' with: [ spec requires: #('Seaside-Component' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Core' with: [ spec requires: #('Seaside-Core' 'Grease Core Tests') ];
				package: 'Seaside-Tests-Development'
					with: [ spec requires: #('Seaside-Development' 'Seaside-Tests-Tools-Web' 'Seaside-Tests-Environment') ];
				package: 'Seaside-Tests-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Environment'
					with: [ 
							spec
								requires:
									#('Seaside-Environment' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop' 'Seaside-Tests-Session' 'Seaside-Tests-Canvas') ];
				package: 'Seaside-Tests-Examples' with: [ spec requires: #('Seaside-Examples' 'Seaside-Tests-Environment') ];
				package: 'Seaside-Tests-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-Tests-Functional') ];
				package: 'Seaside-Tests-Functional'
					with: [ spec requires: #('Seaside-Environment' 'Seaside-Tests-Core' 'Seaside-Widgets') ];
				package: 'Seaside-Tests-HTML5' with: [ spec requires: #('Seaside-HTML5' 'Seaside-Tests-Functional') ];
				package: 'Seaside-Tests-InternetExplorer'
					with: [ spec requires: #('Seaside-InternetExplorer' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-RenderLoop' with: [ spec requires: #('Seaside-RenderLoop' 'Seaside-Tests-Session') ];
				package: 'Seaside-Tests-Session' with: [ spec requires: #('Seaside-Tests-Core' 'Seaside-Session') ];
				package: 'Seaside-Tests-Tools-Web' with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Tests-Environment') ];
				package: 'Seaside-Tests-UTF8' with: [ spec requires: #('Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Welcome' with: [ spec requires: #('Seaside-Welcome') ].
			spec
				package: 'Seaside-FileSystem'
					with: [ 
							spec
								requires: {'Seaside-Core'};
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
				package: 'Seaside-Tests-FileSystem'
					with: [ 
							spec
								requires: {'Seaside-FileSystem'};
								repository: 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ].
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'CI' with: #('Tests' 'Zinc-Seaside' 'Development Tests');
				group: 'Base'
					with:
						#('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Flow' 'Seaside-Environment' 'Seaside-Widgets');
				group: 'Base Tests'
					with:
						#('Base' 'Seaside-Tests-Core' 'Seaside-Tests-Canvas' 'Seaside-Tests-Session' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop' 'Seaside-Tests-Environment' 'Seaside-Tests-Flow');
				group: 'Development' with: #('Base' 'Seaside-Development');
				group: 'Development Tests' with: #('Development' 'Base Tests' 'Seaside-Tests-Development');
				group: 'Core'
					with:
						#('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-Tools-OmniBrowser' 'Seaside-FileSystem');
				group: 'Tests'
					with:
						#('Base Tests' 'Development Tests' 'RSS-Tests-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Email' 'Seaside-Tests-Functional' 'Prototype-Tests-Core' 'Scriptaculous-Tests-Core' 'Scriptaculous-Tests-Components' 'JQuery-Tests-Core' 'JQuery-Tests-UI' 'Seaside-Tests-HTML5' 'Seaside-Tests-InternetExplorer' 'Seaside-Tests-Examples' 'Seaside-Tests-Tools-Web' 'Seaside-Tests-UTF8' 'Seaside-Tests-FileSystem' 'Seaside-Tests-Welcome') ].
	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'Kom'
					with: [ 
							spec
								className: 'ConfigurationOfKomHttpServer';
								versionString: #bleedingEdge;
								repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
				project: 'OB'
					with: [ 
							spec
								className: 'ConfigurationOfOmniBrowser';
								versionString: #stable;
								loads: #('Core');
								repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				project: 'SPort2'
					with: [ 
							spec
								className: 'ConfigurationOfSPort2';
								versionString: '2.33';
								repository: 'http://smalltalkhub.com/mc/Sport/Sport/main' ];
				project: 'WebClient Project'
					with: [ 
							spec
								versionString: '1.5';
								className: 'ConfigurationOfWebClient';
								loads: #('Core');
								repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ];
				project: 'Grease Slime' copyFrom: 'Grease Core' with: [ spec loads: #('Slime') ];
				project: 'Grease Slime Tests' copyFrom: 'Grease Core' with: [ spec loads: #('Slime Tests') ] ]