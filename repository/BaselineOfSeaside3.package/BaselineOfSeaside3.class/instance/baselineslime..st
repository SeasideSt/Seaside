baselines
baselineslime: spec
	spec
		for: #pharo
		do: [ 
			spec
				project: 'Grease Slime' copyFrom: 'Grease' with: [ spec loads: #('Slime') ];
				project: 'Grease Slime Tests' copyFrom: 'Grease' with: [ spec loads: #('Slime Tests') ].
			spec
				package: 'Seaside-Pharo-Slime' with: [ spec requires: #('Grease Slime') ];
				package: 'Seaside-Tests-Slime' with: [ spec requires: #('Seaside-Pharo-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests') ].
			spec
				group: 'Development' with: #('Seaside-Pharo-Slime');
				group: 'Development Tests' with: #('Seaside-Tests-Slime') ]