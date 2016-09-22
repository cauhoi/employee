class EmployeesController < ApplicationController
	def index
		@employees = Employee.includes(:titles).paginate(:page => params[:page], :per_page => 12)		
		# @count = Employee.connection.select_all("select count(*) from employees").rows.first.first
		@count = Employee.count_by_sql("select count(*) from employees")
	end
	def new
		@employee = Employee.new
		
	end
	def create 
		@employee = Employee.new(employee_params)
		@employee.id = Employee.last.id + 1

		if @employee.save && @employee.errors.empty?
			redirect_to @employee
		else
			render :new
		end
	  
		
	end
	def edit
		@employee = Employee.find(params[:id])
		
	end
	def show
		Employee.transaction do
			@employee = Employee.includes(:salaries).find_by(id: params[:id])
		end
	end
	def update
		 @employee = Employee.find(params[:id])
 
		  if @employee.update(employee_params)
		    redirect_to @employee
		  else
		    render 'edit'
		  end
		
	end
	def destroy
		ActiveRecord::Base.transaction do
			@employee = Employee.find_by(id: params[:id])
			@employee.destroy if @employee
		end
		redirect_to employees_path
		
	end
private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name,:hire_date,:birth_date,:gender)
  end
end
