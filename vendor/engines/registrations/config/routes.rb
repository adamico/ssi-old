::Refinery::Application.routes.draw do
  get '/registration', :to => 'registrations#new', :as => 'new_registration'

  resources :registration,
            :only => :create,
            :as => :registrations,
            :controller => 'registrations' do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :registrations, :only => [:index, :show, :destroy]
  end
  resources :payments, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :payments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
