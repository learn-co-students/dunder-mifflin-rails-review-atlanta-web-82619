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
        @employee = Employee.new
        if !params[:employee][:alias].in?(Employee.find_alias) && !params[:employee][:title].in?(Employee.find_title)
            byebug
            @employee.save(employee_params)
            redirect_to employee_path(@employee)
        else
            render 'form'
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    def destroy
        employee = Employee.find(params[:id])
        employee.destory
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
