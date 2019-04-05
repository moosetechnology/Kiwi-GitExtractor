Class {
	#name : #GTLFile,
	#superclass : #GTLObject,
	#instVars : [
		'fullName'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #accessing }
GTLFile >> < aGTLFile [

	^ fullName < aGTLFile fullName
]

{ #category : #accessing }
GTLFile >> fullName [
	^ fullName
]

{ #category : #accessing }
GTLFile >> fullName: anObject [
	fullName := anObject
]

{ #category : #printing }
GTLFile >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	self fullName ifNotNil: [ str nextPutAll: self fullName ].
	str nextPut: $>
]
