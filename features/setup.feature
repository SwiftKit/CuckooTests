Feature: setup
	Scenario: Cocoapods
		Given a file named "podfile" with:
		"""
			use_frameworks!
			target 'CuckooTests' do
				pod 'Cuckoo'
			end
		"""
		And I copy the file from "../SourceFiles/CuckooTests.xcodeproj" to "CuckooTests.xcodeproj"
		And I run `pod repo update`
		When I run `pod install`
		And I run `tmp/Pods/Cuckoo/run generate --no-header --output Actual.swift ../SourceFiles/TestedClass.swift`
		Then the file "../SourceFiles/Expected/TestedClass.swift" should be equal to file "Actual.swift"`
	Scenario: Carthage
		Given a file named "Cartfile" with:
		"""
			github "SwiftKit/Cuckoo"
		"""
		When I run `carthage update`
		And I run `tmp/Carthage/Checkouts/Cuckoo/run generate --no-header --output Actual.swift ../SourceFiles/TestedClass.swift`
		Then the file "../SourceFiles/Expected/TestedClass.swift" should be equal to file "Actual.swift"`