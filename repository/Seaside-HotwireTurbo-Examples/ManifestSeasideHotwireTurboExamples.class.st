Class {
	#name : 'ManifestSeasideHotwireTurboExamples',
	#superclass : 'PackageManifest',
	#category : 'Seaside-HotwireTurbo-Examples-Manifest',
	#package : 'Seaside-HotwireTurbo-Examples',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestSeasideHotwireTurboExamples class >> ruleGRAnsiConditionalsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#WAMethodEditorComponent #renderContentOn: #false)) #'2025-06-28T15:47:37.021467+02:00') )
]

{ #category : 'code-critics' }
ManifestSeasideHotwireTurboExamples class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#WATurboMultiCounter #renderTotalAssignmentFormOn: #false)) #'2025-06-29T14:01:58.528028+02:00') )
]
