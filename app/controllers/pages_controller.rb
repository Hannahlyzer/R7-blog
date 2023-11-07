class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    # Adding this runs set_page on all before running, so we don't need to specify
    # Could add this to end instead of "only": except: [:index, :new, :create]

    def index
        @pages = Page.all
    end

    def show
        # set_page
        # @page = Page.find(params[:id])
    end

    def new
        @page = Page.new
    end

    def create
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
    end

    def edit
        # set_page
        # @page = Page.find(params[:id])
    end

    def update
        # set_page
        # @page = Page.find(params[:id])
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        # set_page
        # @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end

    private

        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end

        # Create a method to set the page and avoid code repitition
        def set_page
            @page = Page.find(params[:id])
        end
end
