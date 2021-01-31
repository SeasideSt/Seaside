"After loading Seaside and Parasol"
Metacello image
 baseline:'Seaside3';
 load: #('Parasol-Tests').
"Commit if executing this on GemStone"
(Smalltalk at: #System ifAbsent:[ nil ]) ifNotNil: [ :systemClass | systemClass commit ].