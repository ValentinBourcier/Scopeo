Class {
	#name : #ScpInstrumentation,
	#superclass : #Object,
	#instVars : [
		'method',
		'handler',
		'object',
		'link'
	],
	#category : #'Scopeo-Instrumentation'
}

{ #category : #accessing }
ScpInstrumentation >> handle: anOperation [

	| return |
	self halt.
	
	(object isNotNil and: [ anOperation receiver ~= object ]) ifTrue: [ ^ self ].
	handler before: anOperation.
	return := handler instead: anOperation.
	handler after: anOperation.
	^ return 
]

{ #category : #accessing }
ScpInstrumentation >> handler [

	^ handler
]

{ #category : #accessing }
ScpInstrumentation >> handler: aHandler [

	handler := aHandler
]

{ #category : #actions }
ScpInstrumentation >> install [

	link:= MetaLink new
    	control: #instead;
     	metaObject: self;
    	selector: #handle:;
		arguments: #( operation );
		yourself.
	method ast link: link.
]

{ #category : #accessing }
ScpInstrumentation >> method [

	^ method
]

{ #category : #accessing }
ScpInstrumentation >> method: aMethod [

	method := aMethod
]

{ #category : #accessing }
ScpInstrumentation >> method: aSelector of: aClass [

	| ignored classes class |
	ignored := { Object . ProtoObject }.
	classes := aClass allSuperclasses reject: [ :c | ignored includes: c ].
	classes addFirst: aClass.
	class := classes detect: [ :c | c includesSelector: aSelector ].
	self method: class >> aSelector
]

{ #category : #accessing }
ScpInstrumentation >> method: aSelector on: anObject [

	self method: aSelector of: anObject class.
	object := anObject
]

{ #category : #installation }
ScpInstrumentation >> uninstall [
	
	link ifNil: [ self error: 'Instrumentation not yet installed.' ].
	method ast removeLink: link.
	link := nil
]