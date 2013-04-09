WebmateApp.define_routes do
  resources :projects, transport: [:http] do
    resources :tasks, transport: [:ws, :http] do
      resources :comments

      collection do
        post "do_on_collection"
        post "update_collection", action: 'not_trivial_name', transport: [:ws], responder: CommentsResponder
      end
    end

    member do
      get "do_on_member"
    end
  end
end
