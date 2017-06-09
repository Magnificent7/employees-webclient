class Employee
  attr_accessor :id, :first_name, :last_name, :email, :birthdate, :ssn, :addresses

  def initialize(input_hash)
    @id = input_hash["id"]
    @first_name = input_hash["first_name"]
    @last_name = input_hash["last_name"]
    @email = input_hash["email"]
    @birthdate = input_hash["birthdate"]
    @ssn = input_hash["ssn"]
    @addresses = input_hash["addresses"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def friendly_birthday
    Date.parse(@birthdate).strftime("%m/%d/%Y")
  end

  def self.find(id)
    employee_hash = Unirest.get("http://localhost:3000/api/v2/employees/#{id}.json").body
    Employee.new(employee_hash)
  end

  def self.all
    @employees = []
    api_employees = Unirest.get("http://localhost:3000/api/v2/employees.json").body
    api_employees.each do |api_employee|
      @employees << Employee.new(api_employee)
    end
    @employees
  end


end