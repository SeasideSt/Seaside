baselines
baselinesqueak: spec

	"Mind that baselinepharo still has a squeakcommon section!"
	spec
		for: #squeak
		do: [ 
			spec
				package: 'Seaside-Squeak-Compatibility';
				package: 'Seaside-Squeak-Core' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Core' with:[ spec includes: #('Seaside-Squeak-Core' 'Seaside-Squeak-Compatibility' ) ];
				package: 'Seaside-Tools-Web' with: [ spec includes: #('Seaside-Squeak-Tools-Web') ];
				package: 'Seaside-Pharo-Development' with: [ spec requires: #('Seaside-Development' 'Seaside-Squeak-Tools-Web' 'Seaside-Pharo-Flow') ];
				package: 'Seaside-Squeak-Tools-Web' with: [ spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas') ];
				package: 'Seaside-Squeak-Continuation' with: [ spec requires: #('Seaside-Core') ];
				package: 'Seaside-Pharo-Flow' with: [ spec requires: #('Seaside-Flow' 'Seaside-Squeak-Continuation') ];
				package: 'Seaside-Tests-Pharo-Continuation' with: [ spec requires: #('Seaside-Squeak-Continuation') ];

				package: 'Seaside-Tests-Core' with: [ spec includes: #('Seaside-Tests-Squeak-Core') ];
				package: 'Seaside-Tests-Squeak-Core' with: [ spec requires: #('Seaside-Squeak-Core' 'Seaside-Tests-Core') ];
				package: 'Seaside-Tests-Pharo-Functional' with: [ spec requires: #('Seaside-Tests-Squeak-Core') ];
				package: 'Seaside-Pharo-Email' with: [ spec requires: #('Seaside-Email' 'Seaside-Squeak-Core') ];
				
				"ToolBuilder based tools"
				package: 'Seaside-Tools-Core' with: [ spec includes: #('Seaside-Squeak-Tools-Development') ];
				package: 'Seaside-Squeak-Tools-Development'  with: [ spec requires: #('Seaside-Tools-Core') ]  ]