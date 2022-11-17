class CommentsController < ApplicationController
 

 def create 
  @post = Post.find(params[:post_id])
  @comment = current_user.comments.new(text: comment_params, author_id: current_user.id, post_id: @post.id)

  if @comment.save 
     format.html do 
      redirect_to post_comments_path(post_id: @comment.post_id), notice: "Post was successfully created!"
     end
   else
     render :new, alert: "Error !"
   end
 end


 def destroy 

 end 

 def destroy 
  @comment = Comment.find(params[:id])
  @post = Post.find(@comment.post_id)
  @post.comments_counter -= 1
  @comment.destroy
  @post.save 
  flash[:success] = "comment was succesfully deleted!"
  redirect_to post_comments_path(post_id : @comment.post_id)
 end


 private 
 def comment_params 
  params.require(:comment).permit(:text)[:text]
 end

end
