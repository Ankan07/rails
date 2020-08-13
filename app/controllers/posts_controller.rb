class PostsController < ApplicationController
   
    def  index
      @posts = Post.all()
    end
    def new
        @post=Post.new
    end
    def edit
    @post= Post.find(params[:id])
    end
    def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]="Article was updated"
      redirect_to action: "show" 
    else
      render 'edit'
    end
    end
    def create
        @post= Post.new(post_params) 
         if @post.save
          flash[:notice] = "Your post was created."
          redirect_to action: "show" , id: @post.id
        else
          render 'new'
        end
    end
    def show
        @post= Post.find(params[:id])
    end
    def destroy
      @post= Post.find(params[:id])
      @post.destroy
      flash[:notice] ="Article deleted"
      redirect_to action: "index"
    end
  
      
    private def post_params
        params.require(:post).permit(:title, :content)
    end

end
