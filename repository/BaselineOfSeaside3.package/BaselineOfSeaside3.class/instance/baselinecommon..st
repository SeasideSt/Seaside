baselines
baselinecommon: spec

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