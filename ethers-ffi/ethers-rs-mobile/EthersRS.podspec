require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "EthersRS"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  ethers-rs compiled for mobile
                   DESC
  s.homepage     = "https://github.com/uniswap/ethers-rs-mobile"
  s.license      = "MIT"
  s.author       = { "author" => "cmcewen@uniswap.org" }
  s.platforms    = { :ios => "9.0", :tvos => "11.0", :watchos => "2.0" }
  s.source       = { :git => "https://github.com/uniswap/ethers-rs-mobile.git", :tag => "#{s.version}" }

  s.source_files = "ios/*.h"
  s.public_header_files = "ios/*.h"
  s.preserve_paths = "ios/*.h"
  s.vendored_libraries = "ios/libethers_ffi.a"
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/ios/**" }

end
