class CommentsController < ApplicationController

    before_action :set_post
    # def index
    #
    # end

    # def new
    #
    # end

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            respond_to do |format|
                format.html {redirect_to root_path}
                format.js
            end
        else
            flash[:alert] = "Please check over your comment before you post it."
            redirect_to root_path
        end
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.delete
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
        redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
