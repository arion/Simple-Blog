namespace :bootstrap do 
  desc "Add the default categories" 
  task :default_categories => :environment do 
    Category.destroy_all
    20.times { |number| Category.create!(:title => "default_#{number}") }
  end
  desc "Run all bootstrapping tasks" 
  task :all => [:default_categories] 
end