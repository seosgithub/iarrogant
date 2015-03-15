![iArrogant: Convert .entitlements into codesignable entitlements](https://raw.githubusercontent.com/sotownsend/iarrogant/master/banner.png)

[![Build Status](https://travis-ci.org/sotownsend/iarrogant.svg)](https://travis-ci.org/sotownsend/iarrogant)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/sotownsend/iarrogant/blob/master/LICENSE)

# What is this?

iArrogant is a command line tool that converts a XML style plist .entitlements file into the proper XML style plist .xcent used by codesign; purpose built for our testing CI system @[Fittr](http://www.fittr.com).

Before you run your entitlements through iarrogant, it may look like this

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.developer.healthkit</key>
	<true/>
</dict>
</plist>
```

After running through iarrogant
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>application-identifier</key>
	<string>ZMEAK3CXPR.com.myapp</string>
	<key>aps-environment</key>
	<string>production</string>
	<key>com.apple.developer.healthkit</key>
	<true/>
	<key>com.apple.developer.team-identifier</key>
	<string>ZMEAK3CXPR</string>
	<key>get-task-allow</key>
	<false/>
</dict>
</plist>
```

## Requirements

- iOS 7.0+ / Mac OS X 10.9+ (Untested)
- Xcode 6.1

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

Run `gem install iarrogant`

---

## Usage


```(sh)>iarrogant <entitlement file path> <team identifier> <bundle id>```

### Convert an entitlement file
```
(sh)>iarrogant MyApp.entitlements 
```

## FAQ

### When should I use iarrogant?

When you're putting a build server togeather for CI and need to alter the provisioning profile with an adhoc distribution.  Codesign will require a copy of the original xcent entitlements which is a modified version of the entitlements file.  iarrogant will produce the correct xcent file for codesign

### What's Fittr?

Fittr is a SaaS company that focuses on providing personalized workouts and health information to individuals and corporations through phenomenal interfaces and algorithmic data-collection and processing.

* * *

### Creator

- [Seo Townsend](http://github.com/sotownsend) ([@seotownsend](https://twitter.com/seotownsend))

## License

iarrogant is released under the MIT license. See LICENSE for details.
