Class {
	#name : #GitRelationator,
	#superclass : #Object,
	#instVars : [
		'argument',
		'selected'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #initialization }
GitRelationator >> argument: aArgument [
"Set the criteria that needs to satisfy a commit"

	argument := Array with: aArgument
]

{ #category : #initialization }
GitRelationator >> initialize [
	super initialize.
	argument := Array new.
	selected := OrderedCollection new.
]

{ #category : #'public - metrics' }
GitRelationator >> numberOfCommits [
"Answer the number of commits at a time"

	^ selected size
]

{ #category : #'public - metrics' }
GitRelationator >> numberOfCommitsWithFeature: aArgument [
"Answer the number of commits that match with a argument at a time"

	^ (selected select: aArgument) size
]

{ #category : #accessing }
GitRelationator >> relation: aBlock commits: aSelected [
"Answer the relation of a matrix time"

	selected := aSelected.
	^ (self perform: aBlock withEnoughArguments: argument)
]
