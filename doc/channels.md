channels/responders logic

get /projects
  user requests a list of /projects
  - so he is interested in projects

subscribe him to 'projects' channel, and returns projects data

create /projects
  - user creates a project. we return project.json if http request
    and publish 'project', 'created', 'project.json' to channel

channel subscription:
  - each channel should have own user
  - on incoming message, we check rights for this project



class ProjectsResponder
  def read_all
    ...
    subscribe_user_to("projects")
  end

  def create
    #...
    #notify_users("projects", "project:created", project.participants)
    #notify_users("projects", "project:created", :broadcast)

    notify_users("projects", "created", project, project.participants)
  end
end
