class EmployeeProjectsController < ApplicationController

  def new
    @employee = Employee.find(params[:employee_id])
    @projects = Project.all
    render :new
  end


  def create
    @project = Project.find(params[:project_id])
    @employee = Employee.find(params[:employee_id])
    @employee.projects.push(@project);
    @employee.save();
    redirect_to division_employee_path(division_id: @employee.division_id, id: @employee.id)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @employee = Employee.find(params[:employee_id])
    @employee.projects.destroy(@project)
    @employee.save();
    redirect_to project_path(id: @project.id)
  end
end
