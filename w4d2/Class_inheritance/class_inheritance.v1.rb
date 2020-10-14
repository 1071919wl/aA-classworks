class Employee
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        self.total_salary * multiplier
    end

    def total_salary
        total_salary = self.salary

        self.employees.each do |employee|
            if employee.employees.nil?
                total_salary += employee.salary
            else
                total_salary += employee.total_salary
            end
        end
        total_salary
    end
end

ned = Manager.new("Ned", "Founder", 1000000, boss=nil)
darren = Manager.new("Darren", "TA Manager", 78000, boss="Ned")
shawna = Employee.new("Shawna", "TA", 12000, boss="Darren")
david = Employee.new("David", "TA", 10000, boss="Darren")