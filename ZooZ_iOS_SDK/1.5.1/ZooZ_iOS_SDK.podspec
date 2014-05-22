{
name: “ZooZ_iOS_SDK,
version: “1.5.1”,
license: {
type: "Commercial",
text: " All text and design is copyright © 2010-2014 Zooz"
},
summary: “ZooZ Payment SDK.”,
homepage: “ZooZ,
authors: {
ZooZ: "support@zooz.com”
},
source: {
http: "https://d193ln56du8muy.cloudfront.net/sdk/1397516197/TestFlightSDK3.0.2.zip"
},
platforms: {
ios: null
},
source_files: "*.h",
preserve_paths: "ZooZSDK.framework",
libraries: [
"TestFlight",
"z"
],
frameworks: "UIKit",
xcconfig: {
LIBRARY_SEARCH_PATHS: ""$(PODS_ROOT)/ZooZ_iOS_SDK""
},
requires_arc: false
}
