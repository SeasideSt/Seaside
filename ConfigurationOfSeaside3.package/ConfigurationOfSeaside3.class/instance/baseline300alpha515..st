baselines-30
baseline300alpha515: spec 
	<version: '3.0.0-alpha5.15-baseline' imports: #( '3.0.0-alpha5.15-commonBaseline' )>

	spec for: #common do: [
		spec
			group: 'Core' with: #('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 
				'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 
				'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web'  
				'Scriptaculous-Components' 'Seaside-Swazoo' 'Seaside-Adaptors-Swazoo' 
				'Seaside-Welcome' 'Seaside-Tools-OmniBrowser' );
			group: 'Tests' with: #('Base Tests' 'Development Tests' 'RSS-Tests-Core' 'Javascript-Tests-Core' 
				'Seaside-Tests-Email' 'Seaside-Tests-Functional'  
				'Prototype-Tests-Core' 'Scriptaculous-Tests-Core' 'Scriptaculous-Tests-Components' 
				'JQuery-Tests-Core' 'JQuery-Tests-UI' 'Seaside-Tests-HTML5' 
				'Seaside-Tests-InternetExplorer' 'Seaside-Tests-Examples' 'Seaside-Tests-Tools-Web' 
				'Seaside-Tests-UTF8' );
			yourself.].
	spec for: #squeakCommon do: [
		spec
			project: 'Kom' with: [
				spec
					className: 'ConfigurationOfKomHttpServer';
					versionString: '1.0-baseline';
					file: 'ConfigurationOfKomHttpServer';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'OB' with: [
				spec
					className: 'ConfigurationOfOmniBrowser';
					loads: #('Core' );
					file: 'ConfigurationOfOmniBrowser';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'SPort2' with: [
				spec
					className: 'ConfigurationOfSPort2';
					versionString: '2.31-baseline';
					file: 'ConfigurationOfSPort2';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			yourself.
			
		spec
			package: 'Javascript-Core' 
				with: [ spec includes: #('Javascript-Pharo-Core' ) ];
			package: 'Seaside-Core' 
				with: [ spec includes: #('Seaside-Pharo-Core' ) ];
			package: 'Seaside-Canvas' 
				with: [ spec includes: #('Seaside-Pharo-Canvas' ) ];
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
			package: 'Seaside-Tools-OmniBrowser' with: [ 
				spec 
					requires: #( 'OB' );
					includes: #('Seaside-Pharo-Tools-OmniBrowser' ) ];

			package: 'Javascript-Tests-Core' 
				with: [ spec includes: #('Javascript-Tests-Pharo-Core' ). ];
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
				with: [ spec requires: #('Seaside-Core') ];
			package: 'Seaside-Pharo-Continuation';
			package: 'Seaside-Pharo-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-Pharo-Tools-Web' 'Seaside-Pharo-Flow') ];
			package: 'Seaside-Pharo-Email' 
				with: [ spec requires: #('Seaside-Email' 'Seaside-Pharo-Core' ) ];
			package: 'Seaside-Pharo-Environment' 
				with: [ spec requires: #('Seaside-Environment' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas' ) ];
			package: 'Seaside-Pharo-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Seaside-Pharo-Continuation' ) ];
			package: 'Seaside-Pharo-Tools-OmniBrowser'  
				with: [ spec requires: #('Seaside-Tools-OmniBrowser' ) ];
			package: 'Seaside-Pharo-Tools-Web' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Pharo-Core' 'Seaside-Pharo-Canvas' ) ];

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
			package: 'Javascript-Tests-Pharo-Core' 
				with: [ spec requires: #('Javascript-Pharo-Core' 'Javascript-Tests-Core' ). ];
			package: 'Seaside-Tests-Pharo-Continuation'  
				with: [ spec requires: #('Seaside-Pharo-Continuation' ) ];
			package: 'Seaside-Tests-Pharo-Core'
				with: [ spec requires: #('Seaside-Pharo-Core' 'Seaside-Tests-Core' ) ];	
			package: 'Seaside-Tests-Pharo-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' 'Seaside-Pharo-Development' ) ];
			package: 'Seaside-Tests-Pharo-Functional'  
				with: [ spec requires: #('Seaside-Tests-Functional' 'Seaside-Tests-Environment' 'Seaside-Pharo-Environment' 'Seaside-Tests-Pharo-Core' ) ];
			
			package: 'Seaside-Tests-Adaptors-Comanche'  
				with: [ spec requires: #('Seaside-Adaptors-Comanche' 'Seaside-Tests-Pharo-Core' )];	
			yourself. 

		spec
			group: 'Core' with: #('Seaside-Adaptors-Comanche' 'Comet-Core' 'Comet-Examples' 'Seaside-FileSystem' );
			group: 'Tests' with: #( 'Seaside-Tests-FileSystem' 'Comet-Tests-Core' 'Seaside-Tests-Adaptors-Comanche' );
				yourself ].

	spec for: #pharo do: [
		spec
			project: 'Grease Slime' copyFrom: 'Grease Core' with: [ 
				spec loads: #('Slime' ) ];
			project: 'Grease Slime Tests' copyFrom: 'Grease Core' with: [
				spec loads: #('Slime Tests' ) ];
			yourself.
		spec
			package: 'Seaside-Slime' 
				with: [ spec requires: #('Grease Slime'). ];
			package: 'Seaside-Tests-Slime' 
				with: [ spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests' ) ];
			yourself. 

		spec
			group: 'Development' with: #('Seaside-Slime' );
			group: 'Development Tests' with: #('Seaside-Tests-Slime' );
			yourself. ].
	spec for: #gemstone do: [
		spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.

		spec 
			project: 'GsCore' with: [
				spec
					className: 'ConfigurationOfGsCore';
					versionString: '0.239-baseline';
					file: 'ConfigurationOfGsCore';
					repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
			project: 'FastCGI' with: [
				spec
					className: 'ConfigurationOfGsFastCGI';
					versionString: '0.231-baseline';
					loads: #('FastCGI' );
					file: 'ConfigurationOfGsFastCGI';
					repository: 'http://seaside.gemstone.com/ss/fastcgi' ];
			project: 'OB' with: [
				spec
					className: 'ConfigurationOfGsOB';
					versionString: '0.239-baseline';
					file: 'ConfigurationOfGsOB';
					repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
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
			package: 'Seaside-Canvas' 
				with: [ spec file: 'Seaside-Canvas.gemstone' ];
			package: 'Seaside-Core' 
				with: [ spec file: 'Seaside-Core.gemstone' ];
			package: 'Seaside-GemStone-Basic-Development' 
				with: [ spec requires: #('Seaside-Core' ) ];
			package: 'Seaside-GemStone-Core' 
				with: [ spec requires: #('Seaside-Core' 'GsCore' ) ];
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
			yourself. 

		spec
			group: 'Base' with: #('Seaside-GemStone-Basic-Development' );
			group: 'Core' with: #('Seaside-Adaptors-FastCGI' );
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
			package: 'Seaside-Development' with: [ spec includes: #('Seaside-GemStone-Development' ) ];
			package: 'Seaside-Environment' 
				with: [ spec requires: #('Seaside-GemStone-Tools-Production') ];
			package: 'Seaside-Flow' 
				with: [ spec includes: #('Seaside-GemStone-Flow' ) ];

			package: 'Seaside-Tests-Development'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Development' ). ];
			package: 'Seaside-Tests-Flow'  
				with: [ spec includes: #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow'). ];

			package: 'Seaside-GemStone-Basic-Development';
			package: 'Seaside-GemStone-Continuation';
			package: 'Seaside-GemStone-Development' with: [
				 spec 
					requires: #('Seaside-Development' 'Seaside-GemStone-Basic-Development' 
								'Seaside-GemStone-Tools-Production' ) ];
			package: 'Seaside-GemStone-Flow'  
				with: [ spec requires: 
					#('Seaside-Flow' 'Seaside-GemStone-Continuation' ) ];
			"Ultimately should be in #gemstone ... object log tool shouldn't need continuations"
			package: 'Seaside-GemStone-Tools-Production'
				with: [spec requires: #('Seaside-Widgets' 'Seaside-GemStone-Basic-Development')];

			package: 'Seaside-Tests-GemStone-Development'  
				with: [ spec requires: #('Seaside-Tests-Development' ) ];
			package: 'Seaside-Tests-GemStone-Continuation'  
				with: [ spec requires: #('Seaside-GemStone-Continuation' ) ];
			package: 'Seaside-Tests-GemStone-Flow' 
				with: [ spec requires: #('Seaside-Tests-Flow' ) ];
			yourself.].
