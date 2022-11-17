class PostsController < ApplicationController

 def index 
  @users = User.find(params[:user_id])
  @posts = @users.posts.includes(:comments)
 end

 def show 
  @users = User.find(params[:user_id])
  @posts = @users.posts.includes(comments: [:author]).find(params[:id])
 end

 def new 
  @post = Post.new
 end

 def create 
  @post = current_user.posts.new(post_params)
  @post.likes_counter = 0
  @post.comments_counter = 0
  respond_to do |format|
   if @post.save 
     format.html do 
      redirect_to user_posts_path(user_id: @post.author.id), notice: "Post was successfully created!"
     end
   else
     render :new, alert: "Error !"
   end
  end
 end

 def destroy 
   @post = Post.find(params[:id])
   @user = User.find(@post.author_id)
   @user.posts_counter -= 1
   @post.destroy
   @user.save 
   flash[:succes] = "Post was successfully deleted!"
   redirect_to user_posts_path(user_id: current_user.id)
 end


 private 
 def post_params 
  params.require(:post).permit(:title, :text)
 end

end
