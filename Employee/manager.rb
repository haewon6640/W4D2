require_relative "employee"
class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss=nil)
        super
        @employees = []
    end

    def bonus(multi)
        sum_salary * multi
    end
    
    protected

    def sum_salary
        sum = 0
        @employees.each do |emp|
            if emp.is_a?(Manager)
                sum += emp.salary
                emp.employees.each do |sub_emp|
                    sum += sub_emp.is_a?(Employee) ? sub_emp.salary : sub_emp.sum_salary
                end
            else
                sum += emp.salary
            end
        end
        sum
    end
end

ned = Manager.new("Ned","Founder",1000000,nil)
darren = Manager.new("Darren","TA Manager",78000,ned)
shawna = Employee.new("Shawna","TA",12000,darren)
david = Employee.new("David","TA",10000,darren)
p darren.employees

p ned.bonus(1.2)