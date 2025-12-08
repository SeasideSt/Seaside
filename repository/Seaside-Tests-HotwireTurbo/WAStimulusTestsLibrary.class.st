Class {
	#name : 'WAStimulusTestsLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'Seaside-Tests-HotwireTurbo',
	#package : 'Seaside-Tests-HotwireTurbo'
}

{ #category : 'as yet unclassified' }
WAStimulusTestsLibrary >> helloControllerJs [

	^ 'import { Application, Controller } from "http://localhost:8080/files/WAStimulusFileLibrary/stimulus.js"
	window.Stimulus = Application.start();
Stimulus.register("hello", class extends Controller {
static targets = [ "name" ]

  greet() {
    console.log(`Hello, ${this.name}!`)
  }

  get name() {
    return this.nameTarget.value
  }
})'
]

{ #category : 'accessing' }
WAStimulusTestsLibrary >> selectorsToInclude [ 

	^ #(helloControllerJs)
]
