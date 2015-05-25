baselines-30
baseline300alpha500: spec 
	<version: '3.0.0-alpha5-baseline'>

	spec for: #common do: [
		spec blessing: #baseline.
		spec description: '3.0.0 baseline based on 3.0.0-alpha5'.
		spec repository: 'http://www.squeaksource.com/Seaside30'.
		spec 
			project: 'Grease' with: [
				spec
					className: 'ConfigurationOfGrease';
					versionString: '1.0-alpha1-baseline';
					loads: #('Grease-Core' );
					projectPackage: [
						spec
							name: 'ConfigurationOfGrease';
							repository: 'http://seaside.gemstone.com/ss/Seaside30' ]];
			project: 'Grease Tests'
				copyFrom: 'Grease'
				with: [ 
					spec 
						versionString: '1.0-alpha1-baseline';
						loads: #('Grease-Tests-Core' ) ];
			yourself.
		spec
			package: 'Javascript-Core' 
				with: [ spec requires: #('Seaside-Core' 'Seaside-Canvas' ). ];
			package: 'JQuery-Core' 
				with: [ spec requires: #('Javascript-Core' ). ];
			package: 'JQuery-UI' 
				with: [ spec requires: #('JQuery-Core' ). ];
			package: 'Prototype-Core' 
				with: [ spec requires: #('Javascript-Core' ). ];
			package: 'RSS-Core' 
				with: [ spec requires: #('Seaside-Canvas' ). ];
			package: 'RSS-Examples' 
				with: [ spec requires: #('RSS-Core' 'Seaside-Tools-Core' ). ];
			package: 'Scriptaculous-Core' 
				with: [ spec requires: #('Prototype-Core' ). ];
			package: 'Scriptaculous-Components' 
				with: [ spec requires: 
					#('Scriptaculous-Core' 'Seaside-Component' 'Seaside-Flow' 'Seaside-Widgets' ). ];
			package: 'Seaside-Canvas' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Component' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Core' 
				with: [ spec requires: #('Grease' ). ];
			package: 'Seaside-Development' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Flow' ). ];
			package: 'Seaside-Email' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Environment' 
				with: [ spec requires: 
					#('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component'
					  'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Widgets' ). ];
			package: 'Seaside-Examples' 
				with: [ spec requires: 
					#('Seaside-Component' 'Seaside-Canvas' 'Seaside-Tools-Core' ). ];
			package: 'Seaside-Flow' 
				with: [ spec requires: 
					#('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop'
					  'Seaside-Tools-Core' ). ];
			package: 'Seaside-HTML5' 
				with: [ spec requires: #('Seaside-Canvas' ). ];
			package: 'Seaside-InternetExplorer' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-RenderLoop' 
				with: [ spec requires: #('Seaside-Component' 'Seaside-Session' ). ];
			package: 'Seaside-Session' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Tools-Core' 
				with: [ spec requires:  
							#('Seaside-Core' 'Seaside-Component' 'Seaside-RenderLoop'
							  'Seaside-Session' ). ];
			package: 'Seaside-Tools-OmniBrowser' 
				with: [ spec requires: #('Seaside-Tools-Core' ). ];
			package: 'Seaside-Tools-Web' 
				with: [ spec requires: 
					#('Seaside-Tools-Core' 'Seaside-RenderLoop' 'Seaside-Widgets' ). ];
			package: 'Seaside-Widgets' 
				with: [ spec requires: #('Seaside-Component' 'Seaside-Canvas' ). ];
			
			package: 'Javascript-Tests-Core' 
				with: [ spec requires: #('Seaside-Tests-Core' 'Javascript-Core' ). ];
			package: 'JQuery-Tests-Core' 
				with: [ spec requires: 
					#('JQuery-Core' 'Javascript-Tests-Core' 'Seaside-Development'
					  'Seaside-Tests-Functional' ). ];
			package: 'JQuery-Tests-UI' 
				with: [ spec requires: #('JQuery-UI' 'JQuery-Tests-Core' ). ];
			package: 'Prototype-Tests-Core' 
				with: [ spec requires: 
					#('Prototype-Core' 'Javascript-Tests-Core' 'Seaside-Tests-Functional' ). ];
			package: 'RSS-Tests-Core' 
				with: [ spec requires: #('RSS-Core' ). ];
			package: 'Scriptaculous-Tests-Core' 
				with: [ spec requires: #('Scriptaculous-Core' 'Prototype-Tests-Core' ). ];
			package: 'Scriptaculous-Tests-Components' 
				with: [ spec requires: #('Scriptaculous-Components' 'Scriptaculous-Tests-Core' ). ];
			package: 'Seaside-Tests-Canvas' 
				with: [ spec requires: #('Seaside-Tests-Core' 'Seaside-Canvas' ). ];
			package: 'Seaside-Tests-Component' 
				with: [ spec requires: #('Seaside-Component' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-Core' 
				with: [ spec requires: #('Seaside-Core' 'Grease Tests' ). ];
			package: 'Seaside-Tests-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-Tests-Tools-Web' ). ];
			package: 'Seaside-Tests-Email' 
				with: [ spec requires: #('Seaside-Email' 'Seaside-Tests-Core' ) ];
			package: 'Seaside-Tests-Environment' 
				with: [ spec requires: 
					#('Seaside-Environment' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop'
					  'Seaside-Tests-Session' 'Seaside-Tests-Canvas' ). ];
			package: 'Seaside-Tests-Examples' 
				with: [ spec requires: #('Seaside-Examples' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-Flow' 
				with: [ spec requires: #('Seaside-Flow' 'Seaside-Tests-Functional' ). ];
			package: 'Seaside-Tests-Functional' 
				with: [  spec requires: #('Seaside-Environment' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-HTML5' 
				with: [ spec requires: #('Seaside-HTML5' 'Seaside-Tests-Functional' ). ];
			package: 'Seaside-Tests-InternetExplorer' 
				with: [ spec requires: #('Seaside-InternetExplorer' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-RenderLoop' 
				with: [ spec requires: #('Seaside-RenderLoop' 'Seaside-Tests-Session' ). ];
			package: 'Seaside-Tests-Session' 
				with: [ spec requires: #('Seaside-Tests-Core' 'Seaside-Session' ). ];
			package: 'Seaside-Tests-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Tests-Environment' ). ];
			package: 'Seaside-Tests-UTF8' 
				with: [ spec requires: #('Seaside-Tests-Core' ). ];
			yourself. ].

	spec for: #squeakCommon do: [
		spec
			package: 'Javascript-Core' 
				with: [ spec includes: #('Javascript-Pharo-Core' ) ];
			package: 'Seaside-Core' 
				with: [ spec includes: #('Seaside-Pharo-Core' ) ];
			package: 'Seaside-Development' 
				with: [ spec includes: #('Seaside-Pharo-Development' ) ];
			package: 'Seaside-Email' 
				with: [ spec includes: #('Seaside-Pharo-Email' ) ];
			package: 'Seaside-Environment' 
				with: [ spec includes: #('Seaside-Pharo-Environment' ) ];
			package: 'Seaside-Flow' 
				with: [ spec includes: #('Seaside-Pharo-Flow' ) ];
			package: 'Seaside-Tools-Web' 
				with: [ spec includes: #('Seaside-Pharo-Tools-Web' ) ];
			package: 'Seaside-Tools-OmniBrowser'  
				with: [ spec includes: #('Seaside-Pharo-Tools-OmniBrowser' ) ];

			package: 'Seaside-Tests-Core' 
				with: [ spec includes: #('Seaside-Tests-Pharo-Core' ). ];
			package: 'Seaside-Tests-Development'  
				with: [ spec includes: #('Seaside-Tests-Pharo-Development' ). ];
			package: 'Seaside-Tests-Flow'  
				with: [ spec includes: #('Seaside-Tests-Pharo-Continuation' ). ];
			package: 'Seaside-Tests-Functional'  
				with: [ spec includes: #('Seaside-Tests-Pharo-Functional' ). ];
			
			package: 'Comet-Pharo-Core' 
				with: [ spec requires: #('Comet-Core' ) ];
			package: 'Javascript-Pharo-Core' 
				with: [ spec requires: #('Javascript-Core' 'Seaside-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Core' 
				with: [ spec requires: #('Seaside-Core' 'Grease') ];
			package: 'Seaside-Pharo-Continuation' 
				with: [ spec requires: #('Grease' ) ];
			package: 'Seaside-Pharo-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-Pharo-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo-Email' 
				with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Environment' 
				with: [ spec requires: #('Seaside-Environment' 'Seaside-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Grease' 'Seaside-Pharo-Continuation' ) ];
			package: 'Seaside-Pharo-Tools-OmniBrowser'  
				with: [ spec requires: #('Seaside-Tools-OmniBrowser' ) ];
			package: 'Seaside-Pharo-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Pharo-Core' ) ];
			package: 'Seaside-Slime' 
				with: [ spec requires: #('Grease' ). ];

			package: 'DynamicBindings'  
				with: [ spec repository: 'http://www.squeaksource.com/KomHttpServer' ];
			package: 'KomServices'  
				with: [ spec repository: 'http://www.squeaksource.com/KomHttpServer' ];
			package: 'KomHttpServer'  
				with: [ spec repository: 'http://www.squeaksource.com/KomHttpServer' ];
			package: 'Seaside-Adaptors-Comanche'  
				with: [ spec requires: 
					#('Seaside-Core' 'DynamicBindings' 'KomServices' 'KomHttpServer' ) ];
			
			package: 'Comet-Core'  
				with: [ spec 
					includes: #('Comet-Pharo-Core' );
					requires: #('Seaside-Canvas' 'Javascript-Core' ) ];
			package: 'Comet-Examples' 
				with: [ spec requires: #('JQuery-UI' 'Comet-Core' ) ];
			
			package: 'Sport-2' 
				with: [ spec repository: 'http://www.squeaksource.com/SPort'. ];
			package: 'Swazoo-2' 
				with: [ spec 
					file: 'Swazoo-2.2'; "load latest picks up Swazoo-2.03, which fails to load"
					requires: #('Sport-2' );
					repository: 'http://www.squeaksource.com/Swazoo'. ];
			package: 'Seaside-Swazoo'  
				with: [ spec 
					requires: #('Grease' 'Swazoo-2' );
					repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];
			package: 'Seaside-Adaptors-Swazoo'  
				with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo' ) ];

			package: 'Seaside-FileSystem' 
				with: [ 
					spec 
						requires: #('Seaside-Core' 'Sport-2' );
						repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];
			package: 'Seaside-Tests-FileSystem' 
				with: [ spec 
					requires: #('Seaside-FileSystem' );
					repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];

			package: 'Comet-Tests-Core'  
				with: [ spec requires: #('Javascript-Tests-Core' 'Comet-Core' ) ];
			package: 'Seaside-Tests-Pharo-Continuation'  
				with: [ spec requires: #('Seaside-Pharo-Continuation' 'Grease Tests' ) ];
			package: 'Seaside-Tests-Pharo-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development' ) ];
			package: 'Seaside-Tests-Pharo-Functional'  
				with: [ spec requires: #('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment' 'Seaside-Tests-Pharo-Core' ) ];
			
			package: 'Seaside-Tests-Adaptors-Comanche'  
				with: [ spec requires: #('Seaside-Adaptors-Comanche' 'Seaside-Tests-Pharo-Core' )];
			
			package: 'Seaside-Tests-Slime' 
				with: [ spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' ) ];
			yourself.
					
		"fix: http://code.google.com/p/seaside/issues/detail?id=484"
		spec
			package: 'Seaside-Tests-Pharo-Core'
				with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core' 'Seaside-Tests-UTF8' ) ];	
			package: 'Seaside-Tests-Core'
				with: [ spec includes: #('Seaside-Tests-UTF8' 'Seaside-Tests-Pharo-Core' ). ];
			yourself. ].

	spec for: #gemstone do: [
		spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.

		spec 
			project: 'FastCGI' with: [
				spec
					className: 'ConfigurationOfGsFastCGI';
					loads: #('FastCGI' );
					projectPackage: [
						spec
							name: 'ConfigurationOfGsFastCGI';
							repository: 'http://seaside.gemstone.com/ss/fastcgi' ]];
			yourself.

		spec
			package: 'Javascript-Core' 
				with: [ spec includes: #('Javascript-GemStone-Core' ) ];
			package: 'Seaside-Core' 
				with: [ spec includes: #('Seaside-GemStone-Core' ) ];
			package: 'Seaside-Development' 
				with: [ spec includes: #('Seaside-GemStone-Development' ) ];
			package: 'Seaside-Email' 
				with: [ spec includes: #('Seaside-GemStone-Email' ) ];
			package: 'Seaside-Environment' 
				with: [ spec includes: #('Seaside-GemStone-Environment' ) ];
			package: 'Seaside-Flow' 
				with: [ spec includes: #('Seaside-GemStone-Flow' ) ];
			package: 'Seaside-Tools-OmniBrowser'  
				with: [ spec includes: #('Seaside-GemStone-Tools-OmniBrowser' ) ];
			package: 'Seaside-Tools-Web' 
				with: [ spec includes: #('Seaside-GemStone-Tools-Web' ) ];

			package: 'JQuery-Tests-Core'
				with: [ spec includes: #('JQuery-Tests-GemStone-Core' ) ];
			package: 'Seaside-Tests-Core' 
				with: [ spec includes: #('Seaside-Tests-GemStone-Core' ). ];
			package: 'Seaside-Tests-Development'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Development' ). ];
			package: 'Seaside-Tests-Flow'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow'). ];
			package: 'Seaside-Tests-Functional'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Functional' ). ];
			package: 'Seaside-Tests-UTF8'  
				with: [ spec includes: #('Seaside-Tests-GemStone-UTF8' ). ];
			
			package: 'Javascript-GemStone-Core' 
				with: [ spec requires: #('Javascript-Core' ) ];
			package: 'Seaside-GemStone-Core' 
				with: [ spec requires: #('Seaside-Core' ) ];
			package: 'Seaside-GemStone-Continuation' 
				with: [ spec requires: #('Grease' ) ];
			package: 'Seaside-GemStone-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-GemStone-Tools-Web' 'Seaside-GemStone-Flow' ) ];
			package: 'Seaside-GemStone-Email' 
				with: [ spec requires: #('Seaside-Email' ) ];
			package: 'Seaside-GemStone-Environment' 
				with: [ spec requires: #('Seaside-Environment' ) ];
			package: 'Seaside-GemStone-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Grease' 'Seaside-GemStone-Continuation' ) ];
			package: 'Seaside-GemStone-Tools-OmniBrowser'  
				with: [ spec requires: #('Seaside-Tools-OmniBrowser' ) ];
			package: 'Seaside-GemStone-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' ) ];

		
			package: 'Seaside-Adaptors-FastCGI'  
				with: [ spec requires: 
					#('Seaside-Core' 'FastCGI' ) ];
			
			package: 'JQuery-Tests-GemStone-Core'
				with: [ spec requires: #('JQuery-Tests-Core' ) ];
			package: 'Seaside-Tests-GemStone-Continuation'  
				with: [ spec requires: #('Seaside-GemStone-Continuation' 'Grease Tests' ) ];
			package: 'Seaside-Tests-GemStone-Core' 
				with: [ spec requires: #('Seaside-Tests-Core' ) ];
			package: 'Seaside-Tests-GemStone-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' ) ];
			package: 'Seaside-Tests-GemStone-Flow' 
				with: [ spec requires: #('Seaside-Tests-Flow' ) ];
			package: 'Seaside-Tests-GemStone-Functional'  
				with: [ spec requires: #('Seaside-Tests-Functional' ) ];
			package: 'Seaside-Tests-GemStone-UTF8'  
				with: [ spec requires: #('Seaside-Tests-UTF8' ) ];
			yourself. ].
