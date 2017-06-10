baselines-320
baseline320welcome: spec

	spec for: #'squeakCommon' do: [

		spec 
			package: 'Seaside-Welcome' with: [
				spec requires: #('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Widgets' 'Seaside-Examples' 'Seaside-Development' 'Seaside-Flow' 'Seaside-Tests-Flow' 'JQuery-Core' 'JQuery-UI' 'JQuery-Tests-Core' 'JQuery-Tests-UI') ];
			package: 'Seaside-Tests-Welcome' with: [
				spec requires: #('Seaside-Welcome' ) ].
		spec 
			group: 'Welcome' with: #('Seaside-Welcome');
			group: 'Welcome Tests' with: #('Seaside-Tests-Welcome');
			group: 'Welcome' with: #( 'Welcome Tests' ) ].		
	
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
			group: 'OneClick' with: #('Comet Examples' 'Seaside-Tools-OmniBrowser' 'Kom') ]