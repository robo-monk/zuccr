class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all
    @posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user_on_post_new_comment = current_user.comments.build
    @user_on_post_new_comment.post = @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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

  def like
    unless current_user.liked_posts.include? @post
      @post.likes << current_user.likes.build
    else
      
    end
    redirect_to @post
  end

  def unlike
    if current_user.liked_posts.include? @post
      @post.likes.delete current_user.likes.find_by_post_id(@post.id)
    else

    end
    redirect_to @post
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
