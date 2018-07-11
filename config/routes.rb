Rails.application.routes.draw do
  resources :people
  resources :superheroes, only: %i[index]
  get '/superheroes/:character_id', to: 'superheroes#show',
                                    as: 'superheroes_show'
end
