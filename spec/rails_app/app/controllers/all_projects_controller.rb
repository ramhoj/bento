class AllProjectsController < ApplicationController
  def edit
    @project = Project.find(params[:id])
    render "projects/edit"
  end
end