class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  helper_method :post, :posts

  def post
    PostDecorator.new(@post, view_context)
  end

  def posts
    @posts.all.map { |post| PostDecorator.new(post, view_context) }
  end


  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all.map { |post| PostDecorator.new(post, view_context) }
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   # @post_deco = PostDecorator.new(@post, view_context)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def create
    po_creater = PostCreateService.call(params: post_params)
    if po_creater.result.success?
      redirect_to po_creater.result.post, notice: 'Post was successfully created.'
    else
      @post = po_creater.result.post
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
