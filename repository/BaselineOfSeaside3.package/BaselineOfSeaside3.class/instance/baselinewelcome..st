baselines
baselinewelcome: spec

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