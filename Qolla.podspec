Pod::Spec.new do |s|
  s.name             = 'Qolla'
  s.version          = '0.0.2.1'
  s.summary          = 'swift things'
  s.description      = 'something something architecture something something appropriation, yadda yadda'

  s.homepage         = 'https://github.com/dpostigo/Qolla'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author           = { 'dpostigo' => 'dani.postigo@gmail.com' }
  s.social_media_url = 'https://twitter.com/alsoyay'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source           = { :git => 'https://github.com/dpostigo/Qolla.git', :tag => s.version.to_s }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.12'


  s.source_files = 'Qolla/**/*'
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation'

end
