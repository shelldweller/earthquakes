Gem::Specification.new do |s|
  s.name          = 'earthquakes'
  s.summary       = 'Information about earthquakes which happened in the past 24 hours'
  s.version       = '0.0.1'
  s.authors       = ['Sergiy Kuzmenko']
  s.email         = ''
  s.files         = ['{lib}/**/*']
  s.executables   << 'earthquakes'
  s.test_files    = Dir['spec/**/*']
  s.require_paths = ['lib']
  s.license       = 'Public domain'

  s.add_development_dependency('rspec')
end
