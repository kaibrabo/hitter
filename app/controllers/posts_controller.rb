class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :owned_post, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            flash[:success] = "Post Successful!"
            redirect_to posts_path
        else
            flash[:alert] = "Post was not successful, try agin."
            render :new
        end
    end

    def edit
        #
    end

    def update
        if @post.update(post_params)
            flash[:success] = "Post Updated!"
            redirect_to posts_path
        else
            flash[:alert] = "Post was not successfully updated, try again."
            redirect_to edit_post_path
        end
    end

    def show
        #
    end

    def destroy
        @post.destroy
        flash[:success] = "Post Deleted!"
        redirect_to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:caption, :image)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def owned_post
        unless current_user == @post.user
            flash[:alert] = "Sorry, you don't have access.."
            redirect_to root_path
        end
    end

end
