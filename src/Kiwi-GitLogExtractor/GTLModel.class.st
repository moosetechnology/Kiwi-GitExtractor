Class {
	#name : #GTLModel,
	#superclass : #GTLObject,
	#instVars : [
		'commits'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #adding }
GTLModel >> addCommit: aCommit [

	commits ifEmpty: [ commits add: aCommit ]
			ifNotEmpty: [ commits add: aCommit before: commits first ].
]

{ #category : #accessing }
GTLModel >> authors [
	"Return the list of authors"
	^ (self commits collect: #author) asSet sorted: [ :a :b | a < b ].
]

{ #category : #accessing }
GTLModel >> comments [

	^ (commits collect: #comment) asSet sorted: [ :a :b | a < b ].
]

{ #category : #accessing }
GTLModel >> commits [

	^ commits
	
]

{ #category : #accessing }
GTLModel >> dates [

	^ (self commits collect: [ :commit | commit date]) asSet

]

{ #category : #accessing }
GTLModel >> days [
	"Return the list of days"
	^ 1 to: 31
]

{ #category : #accessing }
GTLModel >> files [
	"Return the list of files"
	^ (self commits flatCollect: #files) asSet sorted: [ :a :b | a < b ].
]

{ #category : #accessing }
GTLModel >> hours [
	"Return the list of hours"
	^ 0 to: 23
]

{ #category : #initialization }
GTLModel >> initialize [
	super initialize.
	commits := OrderedCollection new.
]

{ #category : #accessing }
GTLModel >> months [

	^ Date monthNames

]

{ #category : #'public - metrics' }
GTLModel >> numberOfAuthors [

	^ self authors size
]

{ #category : #'public - metrics' }
GTLModel >> numberOfCommits [

	^ commits size
]
