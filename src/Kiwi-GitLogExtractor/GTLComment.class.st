Class {
	#name : #GTLComment,
	#superclass : #GTLObject,
	#instVars : [
		'content'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #adding }
GTLComment >> < aGTLComment [

	^ content < aGTLComment content
]

{ #category : #adding }
GTLComment >> addLine: aLine [
	content := content, String cr, aLine
]

{ #category : #accessing }
GTLComment >> content [
	^ content
]

{ #category : #accessing }
GTLComment >> content: anObject [
	content := anObject
]
