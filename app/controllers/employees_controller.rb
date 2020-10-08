class EmployeesController < ApplicationController

    before_save :something to return you

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
        employee = Employee.create(employee_params)
        redirect_to employee_path(employee)
    end

    def edit
        
    end

    def update
        
    end

private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end

    def unique_alias_title(new_alias, new_title)
        @employees = Employee.all
        aliass = []
        titlee = []
        @employees.each do |employee|
            aliass << employee.alias 
            titlee << employee.title
        end
        if aliass.none?(new_alias) && titlee.none?(new_title)
            create
        end
    end

end
