Pod::Spec.new do |s|
  s.name     = 'THToolKit'
  s.version  = '0.1'
  s.platform = :ios, '6.1'
  s.license  = 'MIT'
  s.summary  = 'A useful tool kit for iOS.'
  s.homepage = 'https://github.com/haotang/THToolKit'
  s.authors   = { 'Hom Tang ' => 'th9188@yahoo.com' }
  s.source   = { :git => 'https://github.com/haotang/THToolKit.git', :tag => s.version.to_s }

  s.description = 'THToolKit is an useful tool kit for iOS.'

  s.source_files = 'THToolKit/*.{h,m}'
  s.requires_arc = true
end