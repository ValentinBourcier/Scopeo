Class {
	#name : #ScpBinaryPredicate,
	#superclass : #ScpDataPredicate,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Scopeo-DataPredicates'
}

{ #category : #testing }
ScpBinaryPredicate class >> isAbstract [
		
	^ self == ScpBinaryPredicate
]

{ #category : #instanciation }
ScpBinaryPredicate class >> l: aLeftPredicate r: aRightPredicate [

	^ self new 
		left: aLeftPredicate;
		right: aRightPredicate;
		yourself.
]

{ #category : #accessing }
ScpBinaryPredicate >> left: aLeftPredicate [

	left := aLeftPredicate
]

{ #category : #accessing }
ScpBinaryPredicate >> right: aRightPredicate [

	right := aRightPredicate
]