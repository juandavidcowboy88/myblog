class PostsController < ApplicationController
before_action :authenticate_user!, except: [ :show, :index ]
before_action :is_admin?, only: [ :new, :create, :edit, :update, :destroy ]


  def new
     @post = Post.new

  end
#---------------------------------------------------------------
# metodo create con alertas de creación (success && failure)

  def create
    @post = Post.new(post_params)
#--------------------------------------------------------------

    if @post.save
      flash[:notice] = 'EL post ha sido creado con éxito'
      redirect_to posts_path
    else
      flash[:alert] = 'tu post no ha sido creado con exito'
      render :new
    end
#-----------------------------------------
  end
#-------------------------------------------------------------
  def edit
     @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

     if   @post.update(post_params)
      flash.notice = "Post '#{@post.title}' Updated!"
      redirect_to post_path(@post)
    else
      flash.alert = "sometihing it is not right with the post '#{@post}'"
    end

  end

  def destroy
    @post = Post.delete(params[:id])
     flash[:notice] = "the post #{@post} it is no longer avaliable."
    redirect_to posts_path
  end

  def show
     @post = Post.find(params[:id])
     @comments = @post.comments
     @comment = Comment.new

  end

  def index
    @posts = Post.all
  end

private

#-------------------------------------------------------------------------
#method that ask for the admin user_signed_in.
  def is_admin?
    unless current_user.admin?
          flash[:alert] = 'you can not access this rute'
          redirect_to root_path
        end
      end

  #---------------------------------------------------------------------------------------------------
    def post_params #Seguridad para que el usuario no pueda enviar más información de la requerida
        params.require(:post).permit(:author, :title, :content)
    end
#------------------------------------------------------------------------------------------------------
end
