baselines-30
baseline301Common: spec 
	<version: '3.0.1-commonBaseline'>

	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'pick up Seaside-Tests-Welcom'.
		spec repository: 'http://www.squeaksource.com/Seaside30'.
		spec 
			project: 'Grease Core' with: [
				spec
					className: 'ConfigurationOfGrease';
					versionString: '1.0.1-baseline';
					loads: #('Core' );
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'Grease Core Tests' copyFrom: 'Grease Core' with: [ 
					spec loads: #('Core Tests' ) ];
			project: 'Swazoo2' with: [
				spec
					className: 'ConfigurationOfSwazoo2';
					versionString: '2.2.0.2-baseline';
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
				with: [ spec requires: #('Grease Core' ). ];
			package: 'Seaside-Development' 
				with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Flow' 'Seaside-Environment'). ];
			package: 'Seaside-Email' 
				with: [ spec requires: #('Seaside-Core' ). ];
			package: 'Seaside-Environment' 
				with: [ spec requires: 
					#('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 'Seaside-Component'
					  'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Widgets'). ];
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
			package: 'Seaside-Welcome' 
				with: [ spec requires: 
					#('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Examples' 
					  'Seaside-Development' 'JQuery-Core' 'JQuery-UI' 'Seaside-Flow' 
					  'Seaside-Tests-Flow'  'Seaside-Widgets' ). ];
			package: 'Seaside-Widgets' 
				with: [ spec requires: #('Seaside-Component' 'Seaside-Canvas' ). ];
			
			package: 'Seaside-Swazoo'  
				with: [ 
					spec 
						requires: #('Grease Core' 'Swazoo2' );
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
				with: [ spec requires: #('RSS-Core' 'Seaside-Tests-Core'). ];
			package: 'Scriptaculous-Tests-Core' 
				with: [ spec requires: #('Scriptaculous-Core' 'Prototype-Tests-Core' ). ];
			package: 'Scriptaculous-Tests-Components' 
				with: [ spec requires: #('Scriptaculous-Components' 'Scriptaculous-Tests-Core' ). ];
			package: 'Seaside-Tests-Canvas' 
				with: [ spec requires: #('Seaside-Tests-Core' 'Seaside-Canvas' ). ];
			package: 'Seaside-Tests-Component' 
				with: [ spec requires: #('Seaside-Component' 'Seaside-Tests-Core' ). ];
			package: 'Seaside-Tests-Core' 
				with: [ spec requires: #('Seaside-Core' 'Grease Core Tests' ). ];
			package: 'Seaside-Tests-Development' 
				with: [ spec requires: #('Seaside-Development' 'Seaside-Tests-Tools-Web' 'Seaside-Tests-Environment'). ];
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
				with: [  spec requires: #('Seaside-Environment' 'Seaside-Tests-Core' 'Seaside-Widgets' ). ];
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
			package: 'Seaside-Tests-Welcome' 
				with: [ spec requires: #('Seaside-Welcome' ). ];
			yourself.
		spec
			group: 'Base' with: #('Seaside-Core' 'Seaside-Canvas' 'Seaside-Session' 
				'Seaside-Component' 'Seaside-RenderLoop' 'Seaside-Tools-Core' 'Seaside-Flow'
				 'Seaside-Environment' 'Seaside-Widgets' );
			group: 'Base Tests' with: #('Base' 'Seaside-Tests-Core' 'Seaside-Tests-Canvas'
				'Seaside-Tests-Session' 'Seaside-Tests-Component' 'Seaside-Tests-RenderLoop'
				'Seaside-Tests-Environment' 'Seaside-Tests-Flow' );
			group: 'Development' with: #('Base' 'Seaside-Development' );
			group: 'Development Tests' with: #('Development' 'Base Tests' 'Seaside-Tests-Development' );
			yourself. ].

