baselines
baselinejson: spec

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ) ];
			package: 'Seaside-Tests-JSON' with: [
				spec requires: #('Seaside-JSON-Core' ) ].
		spec 
			group: 'JSON' with: #('Seaside-JSON-Core');
			group: 'JSON Tests' with: #('Seaside-Tests-JSON' );
			group: 'Tests' with: 'JSON Tests' ].
		
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec includes: #('Seaside-Pharo-JSON-Core' ) ].
		spec 
			package: 'Seaside-Pharo-JSON-Core' with: [
				spec requires: #('Seaside-JSON-Core') ].
		spec 
			package: 'Seaside-Tests-JSON' with: [
				spec includes: #('Seaside-Tests-Pharo-JSON-Core' ) ].
		spec 
			package: 'Seaside-Tests-Pharo-JSON-Core' with: [
				spec requires: #('Seaside-Tests-JSON') ] ].
		
	spec for: #'pharo7.x' do: [		
		spec
			package: 'Seaside-Pharo70-JSON-Extensions' with: [ spec requires: #('Seaside-JSON-Core') ];
			package: 'Seaside-Pharo-JSON-Core' with: [ spec includes: #('Seaside-Pharo70-JSON-Extensions') ];
			package: 'Seaside-Tests-Pharo70-JSON-Extensions'with: [ spec requires: #('Seaside-Tests-JSON') ];
			package: 'Seaside-Tests-Pharo-JSON-Core' with: [ spec includes:  #('Seaside-Tests-Pharo70-JSON-Extensions') ] ].
		
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Seaside-JSON-Core'
          with: [ spec includes: #('Seaside-GemStone-JSON-Core') ];
        package: 'Seaside-GemStone-JSON-Core'
          with: [ spec requires: #('Seaside-JSON-Core') ] ]