::Refinery::Application.routes.draw do
  get "/registration" => "schools#registration"
  get "/next" => "schools#next"

  resources :schools, :only => [:index, :show]
  resources :events, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :schools, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :events, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
