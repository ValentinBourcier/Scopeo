Class {
	#name : #ObjectsInteractions,
	#superclass : #Object,
	#instVars : [
		'objects',
		'interactions'
	],
	#category : #'Scopeo-Model'
}

{ #category : #'instance creation' }
ObjectsInteractions class >> fromEvents: aEvents [

	| interactions objects |

	objects := Dictionary new.	
	interactions := aEvents select: [ :e | e isInteraction ].
	interactions do: [ :i | 
		objects at: i originId put: i origin.
		objects at: i destinationId put: i destination.
	].

	^ self new 
		interactions: interactions;
		objects: objects;
		yourself
]

{ #category : #initialization }
ObjectsInteractions >> initialize [

	objects := Dictionary new.
	interactions := OrderedCollection new
	
]

{ #category : #accessing }
ObjectsInteractions >> interactions [

	^ interactions
]

{ #category : #accessing }
ObjectsInteractions >> interactions: anObject [

	interactions := anObject
]

{ #category : #accessing }
ObjectsInteractions >> objects [

	^ objects
]

{ #category : #accessing }
ObjectsInteractions >> objects: anObject [

	objects := anObject
]