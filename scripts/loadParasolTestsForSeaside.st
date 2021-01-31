"After loading Seaside and Parasol"
Metacello image
 baseline:'Parasol';
 load: #('Parasol-Tests').
"Commit if executing this on GemStone"
(Smalltalk at: #System) ifNotNil: [ :systemClass | systemClass commit ].