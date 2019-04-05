Class {
	#name : #GTLDate,
	#superclass : #GTLObject,
	#instVars : [
		'dayName',
		'month',
		'day',
		'time',
		'year',
		'timeZone'
	],
	#category : #'Kiwi-GitLogExtractor'
}

{ #category : #converting }
GTLDate >> < aGTLDate [

	^ self asDate < aGTLDate asDate
]

{ #category : #converting }
GTLDate >> asDate [

	^ Date year: year asInteger month: month day: day asInteger.
]

{ #category : #converting }
GTLDate >> asDay [

	^ day asInteger
]

{ #category : #converting }
GTLDate >> asHour [

	^ time hour24
]

{ #category : #converting }
GTLDate >> asMonth [

	^ Month year: year asInteger month: month
]

{ #category : #converting }
GTLDate >> asYear [

	^ Year year: year asInteger.
]

{ #category : #accessing }
GTLDate >> day [
	^ day
]

{ #category : #accessing }
GTLDate >> day: anObject [
	day := anObject
]

{ #category : #accessing }
GTLDate >> dayName [
	^ dayName
]

{ #category : #accessing }
GTLDate >> dayName: anObject [
	dayName := anObject
]

{ #category : #accessing }
GTLDate >> month [
	^ month
]

{ #category : #accessing }
GTLDate >> month: anObject [
	month := anObject
]

{ #category : #accessing }
GTLDate >> time [
	^ time
]

{ #category : #accessing }
GTLDate >> time: anObject [
	time := Time fromString: anObject
]

{ #category : #accessing }
GTLDate >> timeZone [
	^ timeZone
]

{ #category : #accessing }
GTLDate >> timeZone: anObject [
	timeZone := anObject
]

{ #category : #accessing }
GTLDate >> year [
	^ year
]

{ #category : #accessing }
GTLDate >> year: anObject [
	year := anObject
]
