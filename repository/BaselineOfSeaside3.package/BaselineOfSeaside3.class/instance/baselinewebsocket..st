baselines
baselinewebsocket: spec

	spec for: #'pharo' do: [
		spec blessing: #baseline.
		spec 
			package: 'Seaside-WebSocket-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Canvas' ) ];
"			package: 'Seaside-WebSocket-Tests-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Seaside-WebSocket-Core' ) ];"
			package: 'Seaside-WebSocket-Zinc' with:[ 
				spec requires: #('Zinc' 'Zinc WebSockets') ];
			package: 'Seaside-WebSocket-Examples' with: [
				spec requires: #('JQuery-Core' 'Seaside-WebSocket-Core') ].
			
		spec 
			group: 'WebSocket' with: #('Seaside-WebSocket-Core' 'Seaside-WebSocket-Zinc');
"			group: 'WebSocket Tests' with: #('Seaside-WebSocket-Tests-Core' );"
			group: 'Examples' with: #('Seaside-WebSocket-Examples' )
			"group: 'Tests' with: #('WebSocket Tests')" ]