desc 'Revive all people and rest all superheroes'
task revive_people_rest_superheroes: :environment do
  Person.update_all(defeated: false)
  Superhero.update_all(fought: false)
end

desc 'Run a round'
task run_round: :environment do
  Round.run_round
end

desc 'Reset ranking'
task ranking_reset: :environment do
  Ranking.update
end
