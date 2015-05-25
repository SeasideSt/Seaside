packages
comanchePackages

	^OrderedCollection new
		add: komHttpServer	-> 'DynamicBindings-lr.13.mcz';
		add: komHttpServer	-> 'KomServices-lr.20.mcz';
		add: komHttpServer	-> 'KomHttpServer-lr.52.mcz';
			
		add: seaside30		-> 'Seaside-Adaptors-Comanche-pmm.63.mcz';
		add: seaside30		-> 'Seaside-Tests-Adaptors-Comanche-lr.13.mcz';
		yourself.
