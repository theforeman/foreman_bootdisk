ForemanBootdisk::Engine.routes.draw do
  resources :disks, :only => [] do
    get 'generic', :on => :collection
    get 'help', :on => :collection
    constraints(:id => /[^\/]+/) do
      get 'hosts/:id', :on => :collection, :to => 'disks#host'
      get 'full_hosts/:id', :on => :collection, :to => 'disks#full_host'
      get 'subnet/:id', :on => :collection, :to => 'disks#subnet'
    end
  end

  namespace :api, :defaults => {:format => 'json'} do
    scope "(:apiv)", :module => :v2, :defaults => {:apiv => 'v2'}, :apiv => /v1|v2/, :constraints => ApiConstraints.new(:version => 2) do
      get 'generic', :to => 'disks#generic'
      constraints(:id => /[^\/]+/) do
        get 'hosts/:id', :to => 'disks#host'
      end
    end
  end
end
