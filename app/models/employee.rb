class Employee < ActiveRecord::Base
	has_many :titles
	has_many :salaries
	has_one :department, :through => :dept_emp
	has_one :dept_emp
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :birth_date, presence: true
	validates :hire_date, presence: true
	validate :hire_date_should_be_after_birth_date
  private
	def hire_date_should_be_after_birth_date
		if birth_date && hire_date && (birth_date > hire_date)
			errors.add :base, "wrong data"
		end
		
	end
end