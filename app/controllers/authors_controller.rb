class AuthorsController < ApplicationController
    before_action :authenticate_author!

    def index
        @filterrific = initialize_filterrific(
          Author,
          params[:filterrific]
        ) or return
        @authors = if params[:filterrific].present? && params[:filterrific][:search_query].present?
                        puts params[:filterrific]
                        @filterrific.find
                    else
                        Author.all
                    end
        respond_to do |format|
          format.html
          format.js
        end
      end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)
      
        if @author.save
          redirect_to authors_path
        else
          render :new
        end
    end

    def show
        @authors = Author.find(params[:id])
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
        @author = Author.find(params[:id])
        
        if @author.update(author_params)
            redirect_to author_path(@author)
        else
            render :edit
        end
      end

      private

    def author_params
        params.require(:author).permit(:name)
    end
end
