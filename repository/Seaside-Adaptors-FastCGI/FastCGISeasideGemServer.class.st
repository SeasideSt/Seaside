Class {
	#name : #FastCGISeasideGemServer,
	#superclass : #SeasideGemServer,
	#category : 'Seaside-Adaptors-FastCGI'
}

{ #category : #accessing }
FastCGISeasideGemServer class >> defaultPortList [
  ^ #(9001 9002 9003)
]

{ #category : #accessing }
FastCGISeasideGemServer class >> serverClass [
  ^ WAFastCGIAdaptor
]

{ #category : #logging }
FastCGISeasideGemServer >> disableLogToObjectLog [
  "Setup logging to the Object Log"

  FSLog disableLog
]

{ #category : #logging }
FastCGISeasideGemServer >> enableLogToObjectLog [
  "Setup logging to the Object Log"

  FSLog enableLog
]
