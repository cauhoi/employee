class Department < ActiveRecord::Base
	has_many :employees, through: :dept_emps
	has_many :dept_emps
end