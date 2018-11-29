
Pod::Spec.new do |s|

s.name         = "TS_BaseViewController"
s.version      = "1.0.3"
s.summary      = "A Lib For ViewController."
s.description  = <<-DESC
viewcontroller的基类
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TS_BaseViewController"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source       = { :git => "https://github.com/StoneStoneStoneWang/TS_BaseViewController.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'TS_ToolKit'

s.dependency 'JXTAlertManager'
end

