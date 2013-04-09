class WebmateApp.define_routes do
  put '/api/:id/scope/:porject_id' => 'api/v2/tasks#create', transport: [:ws]

  resources :projects, transport: :http, only: [:read, :read_all, :update, :delete, :create] do
    resources :tasks do
      get
      post
      put
      delete
      member do
        patch :partial_update, transport: :ws, responder: Api::V2::TasksReponder, action: :some_partial_update
      end
    end
  end
end

[ # RoutesCollection
  {
    # RouteDefinition
    method: :put, 
    path: '/api/:id/scope/:project_id', 
    responder: ResponderClass, 
    action: :action_name, 
    transport: [:ws, :http]
  },
 { # RouteDefinition
    method: :patch, 
    path: '/projects/:project_id/tasks/:task_id/partial_update',
    transport: [:ws],
    responder: Api::V2::TasksReponder, 
    action: :some_partial_update
  }
]

RoutesCollection should contain routes and separate it like by method/transport
  {
    'patch' : {
      'ws' : [
        'route_definition'
      ]
      'http' : [
        'route_definition'
      ]
    }
  }
