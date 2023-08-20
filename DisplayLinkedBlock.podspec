Pod::Spec.new do |s|
  s.name             = 'DisplayLinkedBlock'
  s.version          = '1.0.0'
  s.summary          = 'Block-based CADisplayLink observer, free from retain cycle problems.'
  s.description      = <<-DESC
  Block-based helper for CADisplayLink with autoinvalidation on deinit.
                       DESC

  s.homepage         = 'https://github.com/maxoldev/DisplayLinkedBlock'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Max Sol' => 'maxoldev@gmail.com' }
  s.source           = { :git => 'https://github.com/maxoldev/DisplayLinkedBlock.git', :tag => s.version.to_s }
  
  s.swift_versions = ['5']

  s.ios.deployment_target = '10.0'

  s.source_files = 'DisplayLinkedBlock/Classes/**/*'
end
