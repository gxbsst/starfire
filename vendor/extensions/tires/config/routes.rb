Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :tires do
    resources :tires, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :tires, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :tires, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
