Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :tweets
      resources :users
    end
  end

end

#TUTO: https://code.tutsplus.com/es/articles/crafting-apis-with-rails--cms-27695
