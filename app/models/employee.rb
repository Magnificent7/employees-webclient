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
    Date.new(@birthdate).strftime("%m/%d/%Y")
  end

end