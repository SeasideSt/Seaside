baselines-30
baseline300alpha504: spec 
	<version: '3.0.0-alpha5.4-baseline'>

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
					file: 'ConfigurationOfGrease';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'Grease Tests'
				copyFrom: 'Grease'
				with: [ 
					spec 
						versionString: '1.0-alpha1-baseline';
						loads: #('Grease-Tests-Core' ) ];
			project: 'Swazoo2' with: [
				spec
					className: 'ConfigurationOfSwazoo2';
					versionString: '2.2';
					file: 'ConfigurationOfSwazoo2';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
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
			
			package: 'Seaside-Swazoo'  
				with: [ spec 
					requires: #('Grease' 'Swazoo2' );
					repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];
			package: 'Seaside-Adaptors-Swazoo'  
				with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo' ) ];

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
			project: 'Kom' with: [
				spec
					className: 'ConfigurationOfKomHttpServer';
					versionString: '1.0';
					file: 'ConfigurationOfKomHttpServer';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'SPort2' with: [
				spec
					className: 'ConfigurationOfSPort2';
					versionString: '2.31';
					file: 'ConfigurationOfSPort2';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			yourself.
			
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
			
			package: 'Seaside-Pharo-Canvas' 
				with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Canvas' ) ];
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
				with: [ spec requires: #('Seaside-Environment' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas' ) ];
			package: 'Seaside-Pharo-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Grease' 'Seaside-Pharo-Continuation' ) ];
			package: 'Seaside-Pharo-Tools-OmniBrowser'  
				with: [ spec requires: #('Seaside-Tools-OmniBrowser' ) ];
			package: 'Seaside-Pharo-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas' ) ];
			package: 'Seaside-Slime' 
				with: [ spec requires: #('Grease' ). ];

			package: 'Seaside-Adaptors-Comanche'  
				with: [ spec requires: 
					#('Seaside-Core' 'Kom' ) ];
			
			package: 'Comet-Core'  
				with: [ spec 
					includes: #('Comet-Pharo-Core' );
					requires: #('Seaside-Canvas' 'Javascript-Core' ) ];
			package: 'Comet-Examples' 
				with: [ spec requires: #('JQuery-UI' 'Comet-Core' ) ];
			
			package: 'Seaside-FileSystem' 
				with: [ 
					spec 
						requires: #('Seaside-Core' 'SPort2' );
						repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];
			package: 'Seaside-Tests-FileSystem' 
				with: [ spec 
					requires: #('Seaside-FileSystem' );
					repository: 'http://www.squeaksource.com/Seaside30LGPL'. ];

			package: 'Comet-Tests-Core'  
				with: [ spec requires: #('Javascript-Tests-Core' 'Comet-Core' ) ];
			package: 'Seaside-Tests-Pharo-Continuation'  
				with: [ spec requires: #('Seaside-Pharo-Continuation' 'Grease Tests' ) ];
			package: 'Seaside-Tests-Pharo-Core'
				with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core' ) ];	
			package: 'Seaside-Tests-Pharo-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development' ) ];
			package: 'Seaside-Tests-Pharo-Functional'  
				with: [ spec requires: #('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment' 'Seaside-Tests-Pharo-Core' ) ];
			
			package: 'Seaside-Tests-Adaptors-Comanche'  
				with: [ spec requires: #('Seaside-Adaptors-Comanche' 'Seaside-Tests-Pharo-Core' )];
			
			package: 'Seaside-Tests-Slime' 
				with: [ spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' ) ];
			yourself. ].

	spec for: #gemstone do: [
		spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.

		spec 
			project: 'FastCGI' with: [
				spec
					className: 'ConfigurationOfGsFastCGI';
					loads: #('FastCGI' );
					file: 'ConfigurationOfGsFastCGI';
					repository: 'http://seaside.gemstone.com/ss/fastcgi' ];
			project: 'OB' with: [
				spec
					className: 'ConfigurationOfGsOB';
					file: 'ConfigurationOfGsOB';
					repository: 'http://seaside.gemstone.com/ss/GemStone' ];
			yourself.

		spec
			package: 'Javascript-Core' 
				with: [ spec includes: #('Javascript-GemStone-Core' ) ];
			package: 'Seaside-Core' 
				with: [ spec includes: #('Seaside-GemStone-Core' ) ];
			package: 'Seaside-Adaptors-Swazoo' 
				with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo' ) ];
			package: 'Seaside-Email' 
				with: [ spec includes: #('Seaside-GemStone-Email' ) ];
			package: 'Seaside-Environment' 
				with: [ spec includes: #('Seaside-GemStone-Environment' ) ];
			package: 'Seaside-Session' 
				with: [ 
					spec 
						file: 'Seaside-Session.gemstone';
						includes: #('Seaside-GemStone-Session' ) ];
			package: 'Seaside-Tools-OmniBrowser'  
				with: [ 
					spec 
						requires: #( 'OB' );
						includes: #('Seaside-GemStone-Tools-OmniBrowser' ) ];
			package: 'Seaside-Tools-Web' 
				with: [ spec includes: #('Seaside-GemStone-Tools-Web' ) ];

			package: 'Seaside-Tests-Core' 
				with: [ spec includes: #('Seaside-Tests-GemStone-Core' ). ];
			package: 'Seaside-Tests-Functional'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Functional' ). ];
			
			package: 'JQuery-Core' 
				with: [ spec file: 'JQuery-Core.gemstone' ];
			package: 'JQuery-UI' 
				with: [ spec file: 'JQuery-UI.gemstone' ];
			package: 'Javascript-GemStone-Core' 
				with: [ spec requires: #('Javascript-Core' ) ];
			package: 'Prototype-Core' 
				with: [ spec file: 'Prototype-Core.gemstone' ];
			package: 'Seaside-Core' 
				with: [ spec file: 'Seaside-Core.gemstone' ];
			package: 'Seaside-GemStone-Basic-Development' 
				with: [ spec requires: #('Seaside-Tools-Web' ) ];
			package: 'Seaside-GemStone-Core' 
				with: [ spec requires: #('Seaside-Core' ) ];
			package: 'Seaside-GemStone-Email' 
				with: [ spec requires: #('Seaside-Email' ) ];
			package: 'Seaside-GemStone-Environment' 
				with: [ spec requires: #('Seaside-Environment' ) ];
			package: 'Seaside-GemStone-Session' 
				with: [ spec requires: #('Seaside-Session' ) ];
			package: 'Seaside-GemStone-Tools-OmniBrowser'  
				with: [ spec requires: #('Seaside-Tools-OmniBrowser' ) ];
			package: 'Seaside-GemStone-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' ) ];
		
			package: 'Seaside-Adaptors-FastCGI'  
				with: [ spec requires: 
					#('Seaside-Core' 'FastCGI' ) ];
			package: 'Seaside-GemStone-Adaptors-Swazoo'  
				with: [ spec requires: 
					#('Seaside-Adaptors-Swazoo' ) ];
			
			package: 'Seaside-Tests-GemStone-Core' 
				with: [ spec requires: #('Seaside-Tests-Core' ) ];
			package: 'Seaside-Tests-GemStone-Functional'  
				with: [ spec requires: #('Seaside-Tests-Functional' ) ];
			yourself. ].
	spec for: #'gs2.3.x' do: [
		spec
			removePackage: 'JQuery-Tests-Core';
			removePackage: 'JQuery-Tests-UI';
			removePackage: 'Scriptaculous-Components';
			removePackage: 'Scriptaculous-Tests-Components';
			removePackage: 'Seaside-Development';
			removePackage: 'Seaside-Flow';
			removePackage: 'Seaside-Tests-Development';
			removePackage: 'Seaside-Tests-Flow';
			yourself. ].
	spec for: #'gs2.4.x' do: [
		spec
			package: 'Seaside-Development' 
				with: [ spec includes: #('Seaside-GemStone-Development' ) ];
			package: 'Seaside-Flow' 
				with: [ spec includes: #('Seaside-GemStone-Flow' ) ];

			package: 'JQuery-Tests-Core'
				with: [ spec includes: #('JQuery-Tests-GemStone-Core' ) ];
			package: 'Seaside-Tests-Development'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Development' ). ];
			package: 'Seaside-Tests-Flow'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow'). ];

			package: 'Seaside-GemStone-Continuation' 
				with: [ spec requires: #('Grease' ) ];
			package: 'Seaside-GemStone-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-GemStone-Basic-Development' ) ];
			package: 'Seaside-GemStone-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Grease' 'Seaside-GemStone-Continuation' ) ];

			package: 'JQuery-Tests-GemStone-Core'
				with: [ spec requires: #('JQuery-Tests-Core' ) ];
			package: 'Seaside-Tests-GemStone-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' ) ];
			package: 'Seaside-Tests-GemStone-Continuation'  
				with: [ spec requires: #('Seaside-GemStone-Continuation' 'Grease Tests' ) ];
			package: 'Seaside-Tests-GemStone-Flow' 
				with: [ spec requires: #('Seaside-Tests-Flow' ) ];
			yourself.].
