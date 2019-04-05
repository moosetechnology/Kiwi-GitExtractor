Class {
	#name : #GitLogExtractor,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #processing }
GitLogExtractor >> authorFromName: aName [
	| name email index |
	index := aName findString: '<'.
	name := aName copyFrom: 1 to: index - 2.
	email := aName copyFrom: index + 1 to: aName size - 1.
	^ self model authors
		detect: [ :aut | aut fullName = name or: aut email = email]
		ifNone: [ GTLAuthor new
				fullName: name;
				email: email ]
]

{ #category : #processing }
GitLogExtractor >> defineNewCommit: line [
	| commit |
	commit := GTLCommit new.
	commit id: line substrings second.
	model addCommit: commit.
]

{ #category : #initialization }
GitLogExtractor >> initialize [
	super initialize.
	model := GTLModel new.
]

{ #category : #accessing }
GitLogExtractor >> model [
	^ model
]

{ #category : #'public - parsing' }
GitLogExtractor >> parseText: aText [
	"
	Main entry point of the class.
	The input should the content of the file log.txt, obtained from executing the following expression in a GIT repository
	git log --name-only --pretty  > log.txt
	
	GitLogExtractor new parseText: '/tmp/googletest/log.txt' asFileReference contents
	
	"
	aText lines do: [ :line |
		self processLine: line
	].
]

{ #category : #processing }
GitLogExtractor >> processAuthor: line [
	| authorName author |
	authorName := line copyFrom: 'Author: ' size + 1 to: line size.
	author := self authorFromName: authorName asLowercase.
	author addCommit: model commits first.
	model commits first author: author
]

{ #category : #processing }
GitLogExtractor >> processComment: line [
	model commits first comment addLine: (line copyFrom: '    ' size + 1 to: line size)
]

{ #category : #processing }
GitLogExtractor >> processDate: line [
	| d items |
	d := GTLDate new.
	items := line substrings.
	d dayName: items second.
	d month: items third.
	d day: items fourth.
	d time: items fifth.
	d year: items sixth.
	"d timeZone: items seventh."
	model commits first date: d
]

{ #category : #processing }
GitLogExtractor >> processFileName: line [ 
	| ff |
	ff := model files detect: [ :f | f fullName = line ] ifNone: [ GTLFile new fullName: line ].
	model commits first addFile: ff.
]

{ #category : #processing }
GitLogExtractor >> processLine: line [
	
	line isEmpty ifTrue: [ ^ self ].
	(line beginsWith: 'commit') ifTrue: [ ^ self defineNewCommit: line ].
	(line beginsWith: 'Author:') ifTrue: [ ^ self processAuthor: line ].
	(line beginsWith: 'Date:') ifTrue: [ ^ self processDate: line ].
	(line beginsWith: 'Merge:') ifTrue: [ ^ self processMerge: line ].
	(line beginsWith: '    ') ifTrue: [ ^ self processComment: line ].
	
	"If none of the above, then it is a filename"
	^ self processFileName: line
]

{ #category : #processing }
GitLogExtractor >> processMerge: line [
	line substrings allButFirst do: [ :m |
		model commits first addMerge: m ]
]
