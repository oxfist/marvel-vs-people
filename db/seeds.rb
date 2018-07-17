Match.delete_all
Person.delete_all
Round.delete_all

def random_name
  name = ''
  name << "#{Faker::Name.prefix} " if Random.rand >= 0.5
  name << Faker::Name.name
  name << " #{Faker::Name.suffix}" if Random.rand >= 0.5
  name
end

def random_quote
  [
    Faker::Movie.quote,
    Faker::Seinfeld.quote,
    Faker::MichaelScott.quote,
    Faker::WorldOfWarcraft.quote,
    Faker::Matz.quote,
    Faker::Dota.quote,
    Faker::Lebowski.quote,
    Faker::Friends.quote,
    Faker::GreekPhilosophers.quote,
    Faker::Yoda.quote,
    Faker::StarWars.quote,
    Faker::Witcher.quote
  ].sample
end

def random_ability
  [
    Faker::Pokemon.move,
    Faker::Job.key_skill
  ].sample
end

300.times do
  Person.create!(
    {
      name: random_name,
      occupation: Faker::Job.title,
      special_ability: random_ability,
      quote: random_quote
    }
  )
end

200.times do
  Round.run_round
end
