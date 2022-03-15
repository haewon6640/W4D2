class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        children(boss)
    end

    def bonus(multi)
        salary * multi
    end

    private

    def children(boss)
        boss.employees << self unless boss.nil?
    end

end