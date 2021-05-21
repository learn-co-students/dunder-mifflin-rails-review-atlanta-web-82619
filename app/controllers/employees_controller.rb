class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee successfully created"
      redirect_to @employee
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    # byebug
      if @employee.update_attributes(employee_params)
        flash[:success] = "Employee was successfully updated"
        redirect_to @employee
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
      
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:success] = 'Employee was successfully deleted.'
      redirect_to employees_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to employees_path
    end
  end
  

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end
  
  
  
  
  
  
end
