::Refinery::Application.routes.draw do
  resources :tweets, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :tweets, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
