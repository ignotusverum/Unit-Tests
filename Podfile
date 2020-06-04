platform :ios, '11.0'
use_frameworks!
use_modular_headers!
inhibit_all_warnings! # supresses pods project warnings

def tests
  pod 'Quick'
  pod 'Nimble'
end

target 'UnitTests' do
  pod 'RxSwift'
  pod 'RxCocoa'
  
  target 'Tests' do
    inherit! :search_paths
    tests
  end
end
