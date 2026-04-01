#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint disable_battery_optimization.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'disable_battery_optimization_2'
  s.version          = '2.0.0'
  s.summary          = 'Flutter plugin to check and disable battery optimizations on Android.'
  s.description      = <<-DESC
Flutter plugin to check and disable battery optimizations. Also shows custom steps to disable the optimizations in devices like mi, xiaomi, samsung, oppo, huawei, oneplus etc
                       DESC
  s.homepage         = 'https://github.com/AnotherSaman/Disable-Battery-Optimizations-2'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
