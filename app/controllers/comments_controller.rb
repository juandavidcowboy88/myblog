  class CommentsController < ApplicationController
      before_action   :authenticate_user!
      before_action   :is_blogger?




    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        flash[:notice] = 'El comentario ha sido creado con éxito'
      else
        flash[:alert] = 'El comentario no ha sido almacenado'
      end
      redirect_to @comment.post
      # redirect_to post_path(@comment.post) Same as the above
        # method that see if a bloger is it the actual  user_signed_in
        def is_blogger?
        unless current_user.blogger?
        flash[:alert] = 'No tienes permisos para acceder a esta ruta'
        redirect_to root_path
        end
      end
    end



    private
      def comment_params
        params.require(:comment).permit(:author, :post_id, :content)
      end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:author, :title, :content)
    end
