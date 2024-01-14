baselines
baselineslime: spec

	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'Grease Slime' copyFrom: 'Grease' with: [ spec loads: #('Slime') ];
				project: 'Grease Slime Tests' copyFrom: 'Grease' with: [ spec loads: #('Slime Tests') ] ].

	spec
		for: #squeak
		do: [ 
			spec
				package: 'Seaside-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ].

	spec
		for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x')
		do: [ 
			spec
				package: 'Seaside-Pharo-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Pharo-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Pharo-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ].
			
	spec
		for: #(#'pharo11.x' #'pharo12.x')
		do: [ 
			spec
				package: 'Seaside-Pharo11-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Pharo11-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Pharo11-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ]