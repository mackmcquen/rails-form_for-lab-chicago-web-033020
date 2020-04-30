class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(params.require(:school_class).permit(:title, :room_number))
        if @school_class.valid?
            redirect_to SchoolClass.last
        else
            flash[:errors] = @school_class.errors.full_messages
            redirect_to new_school_class_path
        end
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(params.require(:school_class).permit(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    def destroy
        @school_class = SchoolClass.find(params[:id])
        @school_class.destroy
        redirect_to school_classes_path
    end
end
