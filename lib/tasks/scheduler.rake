desc 'Revive all people'
task :revive_people => :environment do
  Person.update_all(defeated: false)
end

desc 'Make all superheroes able to fight'
task :rest_superheroes => :environment do
  Superhero.update_all(fought: false)
end
