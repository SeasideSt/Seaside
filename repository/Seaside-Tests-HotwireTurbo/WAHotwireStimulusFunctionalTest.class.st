Class {
	#name : 'WAHotwireStimulusFunctionalTest',
	#superclass : 'WAHotwiredFunctionalTest',
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'rendering' }
WAHotwireStimulusFunctionalTest >> renderContentOn: html [

	html div
		stimulusController: 'hello';
		with: [
			html textInput
				stimulusTarget: 'name' inController: 'hello';
				placeholder: 'Type a greeting'.
			html button
				stimulusAction: 'click->hello#greet';
				value: 'Greet' ]
]

{ #category : 'hooks' }
WAHotwireStimulusFunctionalTest >> updateRoot: aRoot [
	aRoot javascript
		type: 'module';
		url: WAStimulusFileLibrary / #stimulusJs.
	aRoot javascript
		type: 'module';
		url: WAStimulusTestsLibrary / #helloControllerJs
]
