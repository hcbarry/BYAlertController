#
# Be sure to run `pod lib lint BYAlertController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BYAlertController"
  s.version          = "1.0"
  s.summary          = "Create an UIAlertController style controller with ease"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#     s.description      = <<-DESC
#                          DESC

  s.homepage         = "https://github.com/hcbarry/BYAlertController"
  s.license          = 'MIT'
  s.author           = { "Barry Lee" => "hcbarry@gmail.com" }
  s.source           = { :git => "https://github.com/hcbarry/BYAlertController.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
end
