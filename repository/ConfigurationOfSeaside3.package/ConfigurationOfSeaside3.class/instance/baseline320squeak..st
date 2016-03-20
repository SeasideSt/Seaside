baselines-320
baseline320squeak: spec

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