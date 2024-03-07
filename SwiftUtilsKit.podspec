Pod::Spec.new do |s|
s.name              = "SwiftUtilsKit"
s.version           = "1.2.3"
s.summary           = "Swift utils kit"
s.homepage          = "https://github.com/jadernunes/SwiftUtilsKit.git"
s.author            = "Jáder Nunes"
s.platform          = :ios, "14.0"

s.swift_version     = '5.0'
s.source_files  = "Sources/**/*.{h,m,swift}"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.source = { :git => "git@github.com:jadernunes/SwiftUtilsKit.git", :branch => "master", :tag => "#{s.version}" }
s.frameworks = 'Foundation', 'UIKit'

s.pod_target_xcconfig = {
  'FRAMEWORK_SEARCH_PATHS' => '$(inherited)',
  'BITCODE_GENERATION_MODE' => 'bitcode'
}

end
