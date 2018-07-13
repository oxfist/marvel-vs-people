Rails.application.routes.draw do
  resources :rounds, only: %i[index]
  resources :people
  resources :superheroes, only: %i[index]
  get '/superheroes/:character_id', to: 'superheroes#show',
                                    as: 'superheroes_show'
  post '/new_round', to: 'rounds#create', as: 'new_round'
  post '/revive/:id', to: 'people#revive', as: 'revive_people'
end
