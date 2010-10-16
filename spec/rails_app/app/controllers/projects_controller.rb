class ProjectsController < ApplicationController
  scoped_to_account
  create! { projects_url }
  update! { projects_url }
  destroy! { projects_url }
end