Pod::Spec.new do |s|

  s.name         = "ObjectMapperCacheManager"
  s.version      = "1.1"
  s.summary      = "A Light Tool For Cache Of ObjectMapper."

  s.homepage     = "https://github.com/zzjzz9266a/ObjectMapperCacheManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "zzjzz9266a" => "uestczzj@163.com" }

  #  When using multiple platforms
  s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.11"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/zzjzz9266a/ObjectMapperCacheManager.git", :tag => "v#{s.version}" }

  s.source_files  = 'Source/*.swift'

  s.dependency "ObjectMapper"

  s.requires_arc = true
  s.swift_version = '4.0'
end
