Pod::Spec.new do |s|
  s.name         = 'CMManager'
  s.version      = '2.0'
  s.summary      = "I coded this header to make things easy for me .. But you are free to use it"
  s.homepage         = "https://github.com/crazymind90/CMManager"
  s.license          = 'GPL'
  s.authors          = { "CrazyMind" => "CrazyMind90" }
  s.social_media_url = "https://twitter.com/CrazyMind90"
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/crazymind90/CMManager.git", :tag => s.version.to_s }
  s.source_files = 'CMManager/*.{h,m}', 'CMManager/**/*.{h,m}'
  s.requires_arc = true
end
