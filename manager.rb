require_relative "employee"
class Manager < Employee
    
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multi)
        sum_salary * multi
    end
    private
    def sum_salary
        sum = 0
        @employees.each do |emp|
            if emp.is_a?(Manager)
                sum += emp.salary
                sum += emp.employees.sum do |sub_emp|
                    sub_emp.sum_salary
                end
            else
                sum += emp.salary
            end
        end
        sum
    end

end

a = Manager.new
