Pod::Spec.new do |s|

  s.name         = "ZooZSDK"
  s.version      = "1.5.1"
  s.summary      = "ZooZ SDK Library"

  s.description  = <<-DESC
                   ZooZ Payment Processor for LMD/OneUp applications.
                   DESC

  s.homepage     = "http://zooz.com"
  s.license      = "COMMERCIAL"

  s.author       = { "Michael Morris" => ",mmorris@1up.fm" }

  s.platform     = :ios, "6.0"

  s.source       = { :http => "http://devapi.letsmovedown.com/PodLibs/ZooZSDK.embeddedframework.zip" }

  s.source_files  = "ZooZSDK.framework/Versions/A/*.h"

  # s.framework  =
  s.frameworks = "Quartz", "Security"
  s.libraries = "z", "xml2", 
  s.requires_arc = true

  s.resource_bundles = { 
  	'ZooZResources' => ['Resources/*'],
  }

end
