# request/response formats
# request
  HTTP:
    post '/projects/:project_id/tasks', :params

    => path: '/projects/:project_id/tasks'
    => params: params
    => metadata: {}  # data to passback
    => action: tasks
  
  WS:
    'some kind of channel/ transport'
    message:
      method: 'post'
      path: '/projects/:project_id/tasks'
      params: {}
      metadata: {} # data to passback

# Response:

  response:
    request: {
      path:
      metadata: }
    action: 'action'
    response: { 
      body: body
      status: 200
    }
