Class {
	#name : #GTLAuthor,
	#superclass : #GTLObject,
	#instVars : [
		'fullName',
		'email',
		'commits'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #accessing }
GTLAuthor >> < aGTLAuthor [

	^ fullName < aGTLAuthor fullName
]

{ #category : #accessing }
GTLAuthor >> addCommit: aCommit [

	commits add: aCommit.
]

{ #category : #accessing }
GTLAuthor >> email [

	^ email
]

{ #category : #accessing }
GTLAuthor >> email: aEmail [

	email := aEmail
]

{ #category : #accessing }
GTLAuthor >> fullName [
	^ fullName
]

{ #category : #accessing }
GTLAuthor >> fullName: anObject [

	commits := OrderedCollection new.
	fullName := anObject
]

{ #category : #accessing }
GTLAuthor >> numberOfCommits [

	^ commits size
]
