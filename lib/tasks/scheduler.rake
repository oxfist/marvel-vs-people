desc 'Revive all people and rest all superheroes'
task :revive_people_rest_superheroes => :environment do
  Person.update_all(defeated: false)
  Superhero.update_all(fought: false)
end
