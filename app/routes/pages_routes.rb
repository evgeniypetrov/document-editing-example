WebmateApp.define_routes do
  get '/', to: 'pages#index', transport: [:http]
end
