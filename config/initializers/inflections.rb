Rails.autoloaders.each do |autoloader|
  autoloader.inflector.inflect(
    'iso_generator' => 'ISOGenerator'
  )
end
