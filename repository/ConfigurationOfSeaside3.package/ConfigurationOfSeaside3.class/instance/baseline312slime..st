baselines-311-312
baseline312slime: spec

	spec for: #'squeakCommon' do: [
		spec 
			project: 'Grease Slime' copyFrom: 'Grease' with: [
				spec loads: #('Slime' ) ];
			project: 'Grease Slime Tests' copyFrom: 'Grease' with: [
				spec loads: #('Slime Tests' ) ].
		].
		
	 spec for: #(#'squeak' #'pharo1.x' #'pharo2.x' #'pharo3.x') do: [	
		spec
			package: 'Seaside-Slime' with: [
				spec requires: #('Grease Slime' ). ];
			package: 'Seaside-Tests-Slime' with: [
				spec requires: #('Seaside-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests' ). ]. 

		spec 
			group: 'Development' with: #('Seaside-Slime' );
			group: 'Development Tests' with: #('Seaside-Tests-Slime' ) 
	].

	 spec for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x') do: [	
		spec
			package: 'Seaside-Pharo40-Slime' with: [
				spec requires: #('Grease Slime' ). ];
			package: 'Seaside-Tests-Slime' with: [
				spec requires: #('Seaside-Pharo40-Slime' 'Seaside-Tests-Component' 'Grease Slime Tests' ). ]. 

		spec 
			group: 'Development' with: #('Seaside-Pharo40-Slime' );
			group: 'Development Tests' with: #('Seaside-Tests-Slime' ) 
	].
