::Refinery::Application.routes.draw do
  get '/registration', :to => 'registrations#new', :as => 'new_registration'
  get '/thank_you' => "registrations#thank_you"

  resources :registrations,
            :only => :create

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :registrations, :only => [:index, :show, :destroy]
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :payments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
