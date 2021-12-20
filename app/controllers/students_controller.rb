class StudentsController < ApplicationController

    def index
        render json: Student.all
    end

    def show
        student = find_student
        render json: student
    end

    def create
        student = Student.create!(student_params)
        render json: student.instructor, status: :created
    end

    def update
        student = find_student
        student.update!(student_params)
        render json: student.instructor, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    private

    def find_student
        Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age)
    end
    
    
end
