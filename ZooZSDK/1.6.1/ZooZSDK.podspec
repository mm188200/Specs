Pod::Spec.new do |s|

  s.name         = "ZooZSDK"
  s.version      = "1.6.1"
  s.summary      = "ZooZ SDK Library"

  s.description  = <<-DESC
                   ZooZ Payment Processor for LMD/OneUp applications.
                   DESC

  s.homepage     = "http://zooz.com"
  s.license      = "COMMERCIAL"

  s.author       = { "Michael Morris" => ",mmorris@1up.fm" }

  s.platform     = :ios, "6.0"

  s.source       = { :http => "http://devapi.letsmovedown.com/PodLibs/ZooZ_iOS_SDK_1.5.1.zip" }
  s.source_files  = "ZooZSDK.embeddedframework/ZooZSDK.framework/Versions/A/Headers/*"

  # s.framework  =
  s.frameworks = "Quartz", "Security"
  s.libraries = "z", "xml2" 
  s.requires_arc = true
  s.preserve_paths = "ZooZSDK.embeddedframework/ZooZSDK.framework/Versions/A/"
  s.resource_bundles = { 
  	'ZooZResources' => ['Resources/*']
  }
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/ZooZSDK/"' }
  framework_path = 'ZooZSDK.embeddedframework/ZooZSDK.framework/Versions/A/ZooZSDK'


end
