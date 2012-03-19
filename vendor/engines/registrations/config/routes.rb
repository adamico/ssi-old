::Refinery::Application.routes.draw do
  get '/registration', :to => 'registrations#new', :as => 'new_registration'
  get '/thank_you' => "registrations#thank_you"
  get '/payment_accepted', :to => "paybox#accepted", :as => 'payment_accepted'
  get '/payment_refused', :to => "paybox#refused", :as => 'payment_refused'
  get '/payment_canceled', :to => "paybox#canceled", :as => 'payment_canceled'
  get '/ipn', :to => "paybox#ipn", :as => "payment_callback"

  resources :registrations,
            :only => [:new, :create, :edit, :update]

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
