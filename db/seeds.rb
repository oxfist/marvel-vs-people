Match.delete_all
Person.delete_all
Round.delete_all
Superhero.delete_all

Person.create!(
  [
    {
      name: 'John Doe',
      occupation: 'Carpenter',
      special_ability: 'Fast hammering',
      quote: 'I\'ll chop you like a tree'
    },
    {
      name: 'Alan Turing',
      occupation: 'Mathematics professor',
      special_ability: 'Code breaker',
      quote: 'Sometimes it is the people no one can imagine anything of who '\
             'do the things no one can imagine'
    }
  ]
)

Superhero.create!(
  [
    {
      name: 'Thanos',
      character_id: 1009652
    },
    {
      name: 'Spider-Man',
      character_id: 1009610
    }
  ]
)

Round.create!
Round.create!
Round.create!

Match.create!(
  [
    {
      round: Round.first,
      person: Person.first,
      superhero: Superhero.first,
      person_won: false
    },
    {
      round: Round.second,
      person: Person.second,
      superhero: Superhero.second,
      person_won: true
    },
    {
      round: Round.second,
      person: Person.second,
      superhero: Superhero.first,
      person_won: false
    },
    {
      round: Round.third,
      person: Person.first,
      superhero: Superhero.first,
      person_won: true
    },
    {
      round: Round.third,
      person: Person.first,
      superhero: Superhero.second,
      person_won: true
    }
  ]
)
