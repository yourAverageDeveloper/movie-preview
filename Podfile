# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MoviePreview' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'Alamofire'
  pod 'ProgressHUD'
  pod 'UIGradient'
  pod 'ShadowView'
  

  # Pods for MoviePreview

end

post_install do |installer|
  installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
             end
        end
 end
    installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end
