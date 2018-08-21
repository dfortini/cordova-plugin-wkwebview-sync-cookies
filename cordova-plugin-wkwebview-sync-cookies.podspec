Pod::Spec.new do |s|
    s.name               = "cordova-plugin-wkwebview-sync-cookies"
    s.version            = "0.1.0"
    s.summary            = "Plugin to save cookies on Cordova web view."
    s.platform           = :ios, '9.0'
    s.description        = <<-DESC "cordova-plugin-wkwebview-sync-cookies"
    DESC
    s.license            = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
    s.homepage           = "https://github.com/psirenny/cordova-plugin-wkwebview-sync-cookies"
    s.author             = { "Dennis Torres" => "psirenny" }
    s.source_files       = "src/WKWebViewSyncCookies.{h,m}"
    s.source             = { :git => "https://github.com/psirenny/cordova-plugin-wkwebview-sync-cookies", :tag => "0.1.0" }
    s.dependency 'Cordova'

    
end
