source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target "Module-2" do
pod 'Alamofire', '4.0.0'
pod 'SwiftyJSON', '3.0.0'
pod 'RealmSwift', '1.1.0'
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end
