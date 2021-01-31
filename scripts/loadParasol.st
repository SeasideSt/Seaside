"Seaside uses Parasol for executing its functional tests. Since Parasol also depends on Seaside for its
Seaside-specific extensions, it also has a dependency on Seaside. To break this dependency loop, you need 
to load Parasol explicitly yourself when executing the Parasol tests for Seaside."
Metacello new
 baseline:'Parasol';
 repository: 'github://SeasideSt/Parasol:master/repository';
 load: #('default').
"Commit if executing this on GemStone"
(Smalltalk at: #System) ifNotNil: [ :systemClass | systemClass commit ].