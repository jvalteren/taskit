Class {
	#name : 'TKTMemoryLeakTest',
	#superclass : 'TKTTestCase',
	#category : 'TaskIt-Tests-Kernel',
	#package : 'TaskIt-Tests',
	#tag : 'Kernel'
}

{ #category : 'private' }
TKTMemoryLeakTest class >> isAbstract [

	^ self name = #TKTMemoryLeakTest
]

{ #category : 'helpers' }
TKTMemoryLeakTest >> trackInstancesOf: aClass during: aBlock [

	| before |
	before := aClass allInstances size.

	aBlock value.

	self assertWithGarbageCollect: [ before >= aClass allInstances size ]
]
