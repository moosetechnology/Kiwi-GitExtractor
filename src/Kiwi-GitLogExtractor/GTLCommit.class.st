Class {
	#name : #GTLCommit,
	#superclass : #GTLObject,
	#instVars : [
		'id',
		'author',
		'comment',
		'files',
		'date',
		'merges'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #comparing }
GTLCommit >> < aCommit [

	^ date < aCommit date
]

{ #category : #adding }
GTLCommit >> addFile: aFile [
	files add: aFile
]

{ #category : #adding }
GTLCommit >> addMerge: idOfMerge [

	merges add: idOfMerge
]

{ #category : #accessing }
GTLCommit >> author [
	^ author
]

{ #category : #accessing }
GTLCommit >> author: anObject [
	author := anObject
]

{ #category : #accessing }
GTLCommit >> comment [
	^ comment
]

{ #category : #accessing }
GTLCommit >> comment: anObject [
	comment := anObject
]

{ #category : #actions }
GTLCommit >> commit [
	^ self
]

{ #category : #operation }
GTLCommit >> containsFile: aBlock [
"Recive a block that needs one argument a File. This message returns if exist a file that match with the block criteria"
	
	^ (self files select: [ :f | aBlock rtValue: f ]) isNotEmpty.
]

{ #category : #accessing }
GTLCommit >> date [
	^ date
]

{ #category : #accessing }
GTLCommit >> date: anObject [
	date := anObject
]

{ #category : #accessing }
GTLCommit >> day [
	^ date asDay
]

{ #category : #accessing }
GTLCommit >> files [
	^ files
]

{ #category : #accessing }
GTLCommit >> files: anObject [
	files := anObject
]

{ #category : #accessing }
GTLCommit >> hour [
	^ date asHour
]

{ #category : #accessing }
GTLCommit >> id [
	^ id
]

{ #category : #accessing }
GTLCommit >> id: anObject [
	id := anObject
]

{ #category : #initialization }
GTLCommit >> initialize [
	super initialize.
	
	id := '00'.
	author := GTLAuthor new fullName: 'UNKNOWN'.
	comment := GTLComment new content: ''.
	files := OrderedCollection new.
	merges := OrderedCollection new
]

{ #category : #accessing }
GTLCommit >> merges [
	^ merges
]

{ #category : #accessing }
GTLCommit >> month [
	^ date asMonth name
]

{ #category : #accessing }
GTLCommit >> year [
	^ date asYear
]
