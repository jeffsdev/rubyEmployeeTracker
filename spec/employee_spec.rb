require('spec_helper')
require('./lib/division')
require('./lib/employee')

describe(Employee) do
  describe("#new") do
    it("will create a new employee") do
      test_employee = Employee.create({name: "bobillyjoe",
                                    division_name: "IT"})
      expect(test_employee.name()).to(eq("bobillyjoe"))
    end
  end



end
