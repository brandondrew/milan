ActionController::Routing::Routes.draw do |map|

  # map.sections 'sections/:id', :controller => "sections", :action => "index"

  map.root :controller => 'sections'
  
  # map.resources :sections do |sections|
  #   sections.resources :stories
  # end
  map.resources :sections, :has_many => :stories

  # map.resources :sections
  # in the future I want URLs like:
  # /sports/harbor-springs-rams-enter-world-series
  # /business/apple-ditches-att-for-verizon-and-sprint
  
  
  # date-based routes:
  # /2008/04/01
  # /2008/04/
  # /2008
  # map.connect 'stories/:year/:month/:day', :controller => 'stories', 
    # :month => nil, :day => nil, :requirements => { :year => /\d{4}/ }
  # add something like this to index action:
  # @stories = Story.by_date(params[:year], params[:month], params[:day])
  
  
  # /world/2008/04/01
  # /world/ etc.
  
  
  
  map.resources :photos

  map.resources :stories

  map.root :controller => "stories", :action => "index"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
