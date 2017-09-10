class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)

        if @post.save
            flash[:success] = "Post Successful!"
            redirect_to @post
        else
            flash[:alert] = "Post was not successful, try agin."
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Post Deleted!"
        redirect_to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:caption, :image)
    end

end
