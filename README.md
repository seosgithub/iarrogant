![iArrogant: Convert .entitlements into codesignable entitlements](https://raw.githubusercontent.com/GndFloor/FittrJSON/master/FittrJSON.png)

iArrogant is a tool that converts a XML style plist .entitlements file into the proper XML style plist .xcent used by codesign; purpose built for our testing CI system @[Fittr](http://www.fittr.com)

![](https://travis-ci.org/GndFloor/FittrJSON.svg)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/KrauseFx/fastlane/blob/master/LICENSE)

## Features

- [x] Fast. Usually one or two orders of magnitude faster than other swift JSON libraries
- [x] Reads from NSString/String, NSData, and NSDictionary/Dictionary types
- [x] Export back to JSON
- [x] Complete Documentation

## Requirements

- iOS 7.0+ / Mac OS X 10.9+ (Untested)
- Xcode 6.1

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

Copy the `FittrJSON.swift` source file directly into your project.

---

## Usage

### Initialize

```swift
	//You pulled a UTF8 string from your server and it's sitting in an NSData
	var myJSONData: NSData! = ...
	let json = FittrJSON(myJSONData)
	
	//You have an NSDictionary that was parsed from JSON
	var myParsedJSON: NSJSON! = ...
	let json = FittrJSON(myParsedJSON)
```

### Getting values
FittrJSON uses swift's type matching features to automatically resolve the correct getters for the data your requesting.  In order for this to work correctly, you must cast your type with ```as T``` at the end of your request.

```swift
	//Get a string
	let val = json["my_key"][0]["my_sub_key"] as String
	
	//Get a CGFloat
	let val = json["my_key"][0]["my_sub_key"] as CGFloat
	
	//Array of things
	let val = json["my_key"][0]["my_sub_key"] as [CGFloat]
	
```

You may, however, store intermediate values without a type cast

```swift
	//Intermediate calculation with array
	let arr = json["my_key"]
	let val = arr[0]["my_sub_key"] as CGFloat
	
	//Intermediate calculation with dictionary
	let dict = json["my_key"][0]
	let val = dict["my_sub_key"] as CGFloat
```

w.i.p

* * *

## FAQ

### When should I use FittrJSON?

If you're starting a new project in Swift, and want to take full advantage of its conventions and language features, FittrJSON is a great choice.

### What's Fittr?

Fittr is a SaaS company that focuses on providing personalized workouts and health information to individuals and corporations through phenomenal interfaces and algorithmic data-collection and processing.

* * *

### Creator

- [Seo Townsend](http://github.com/sotownsend) ([@seotownsend](https://twitter.com/seotownsend))

## License

FittrJSON is released under the MIT license. See LICENSE for details.

## Credits

This README file was based on ([Alamofire](https://github.com/Alamofire/Alamofire)) by ([@matt](https://twitt.rocm/matt))
