platform :ios, '14.4'
source 'https://github.com/CocoaPods/Specs.git'

target 'DCX2022A' do
  use_frameworks!

  pod 'Alamofire'
  pod 'SwiftyJSON'
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['COMPATIBILITY_VERSION_BY_OBJECT_VERSION'] = '54' # XCode 12.0 Compatable
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.4'
      end
    end
  end
end