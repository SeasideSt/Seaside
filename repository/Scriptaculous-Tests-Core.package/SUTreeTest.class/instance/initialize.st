initialization
initialize
	super initialize.
	tree := OrderedCollection new
		add: nil -> 'Eukaryota';
			add: 'Eukaryota' -> 'Opisthokonts';
				add: 'Opisthokonts' -> 'Animalia';
				add: 'Opisthokonts' -> 'Choanoflagellates';
				add: 'Opisthokonts' -> 'Nucleariids';
				add: 'Opisthokonts' -> 'Fungi';
			add: 'Eukaryota' -> 'Amoebozoa';
				add: 'Amoebozoa' -> 'Plantae';
				add: 'Amoebozoa' -> 'Red algae';
				add: 'Amoebozoa' -> 'Glaucophytes';
			add: 'Eukaryota' -> 'Plants';
				add: 'Plants' -> 'Cercozoa';
				add: 'Plants' -> 'Foraminifera';
				add: 'Plants' -> 'Polycystinea';
				add: 'Plants' -> 'Acantharea';
				add: 'Plants' -> 'Sticholonche';
			add: 'Eukaryota' -> 'Rhizaria';
		yourself