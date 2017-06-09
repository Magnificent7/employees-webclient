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
    employee = Unirest.post("http://localhost:3000/api/v2/employees.json", :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}, :headers => {"Accept" => "application/json"}).body
    redirect_to employee_path(employee['id'])
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{params[:id]}.json").body
  end

  def update
    employee = Unirest.patch("http://localhost:3000/api/v2/employees/#{params[:id]}.json", :parameters => {:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :birthdate => params[:birthdate], :ssn => params[:ssn]}, :headers => {"Accept" => "application/json"}).body
    redirect_to employee_path(employee['id'])
  end

  def destroy
    employee = Unirest.delete("http://localhost:3000/api/v2/employees/#{params[:id]}.json")
    redirect_to employees_path
  end

end

