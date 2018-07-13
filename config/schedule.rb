every 1.days, at: '0:00 am' do
  rake 'revive_people_rest_superheroes'
end

every 10.minutes do
  rake 'run_round'
end
