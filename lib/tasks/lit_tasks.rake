namespace :lit do
  desc 'Exports translated strings from lit to config/locales/lit.yml file.'
  task export: :environment do
    if yml = Lit.init.cache.export
      PATH = 'config/locales/lit.yml'
      File.new("#{Rails.root}/#{PATH}", 'w').write(yml)
      puts "Successfully exported #{PATH}."
    end
  end
  
  desc 'Insert all locales to the database.'
  task load: :environment do
    I18n.backend.send(:load_translations)
  end
end
