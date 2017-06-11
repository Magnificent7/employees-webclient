class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def create
    employee = Unirest.post("#{ENV['API_ROOT_URL']}/employees.json", :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}, :headers => {"Accept" => "application/json"}).body
    redirect_to employee_path(employee['id'])
  end

  def edit
    @employee = Unirest.get("#{ENV['API_ROOT_URL']}/employees/#{params[:id]}.json").body
  end

  def update
    employee = Unirest.patch("#{ENV['API_ROOT_URL']}/employees/#{params[:id]}.json", :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}, :headers => {"Accept" => "application/json"}).body
    redirect_to employee_path(employee['id'])
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    redirect_to employees_path
  end

end

