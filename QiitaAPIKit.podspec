#
#  Be sure to run `pod spec lint QiitaAPIKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "QiitaAPIKit"
  spec.version      = "0.0.7"
  spec.summary      = "A breif tool to use Qiita API (v2)"
  spec.description  = <<-DESC
  A breif tool to use Qiita API (v2) : https://qiita.com/api/v2/docs
                   DESC
  spec.homepage     = "http://github.com/ry-itto/QiitaAPIKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ry-itto" => "horusu.dqx@gmail.com" }
  spec.social_media_url   = "https://twitter.com/ry_itto"
  spec.platform     = :ios, "11.0"
  spec.swift_versions = '5.0'
  spec.source       = { :git => "https://github.com/ry-itto/QiitaAPIKit.git", :tag => "v#{spec.version}" }
  spec.source_files = "Sources/QiitaAPIKit/*.swift"
  spec.requires_arc = true
end
