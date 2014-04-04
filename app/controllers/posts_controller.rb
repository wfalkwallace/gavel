class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  skip_before_filter :require_user, :only => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @response = Response.new
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
    @post.author = @current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  # upvote /posts/1/upvote
  def upvote
    if @current_user.upvotes.where(id: params[:id]).exists? ||
      @current_user.downvotes.where(id: params[:id]).exists?
      redirect_to :back
      flash[:notice] = "You can't vote twice!"
    else
      @post.inc(upvote_count: 1)
      @current_user.upvotes << @post

      @post.save
      @current_user.save

      redirect_to :back
      flash[:notice] = "Vote successfully recorded!"
    end
  end

  # upvote /posts/1/downvote
  def downvote
    p "THIS:", @current_user.downvotes.where(id: params[:id]).exists?
    if @current_user.downvotes.where(id: params[:id]).exists? ||
      @current_user.upvotes.where(id: params[:id]).exists?
      redirect_to :back
      flash[:notice] = "You can't vote twice!"
    else
      @post.inc(downvote_count: 1)
      @current_user.downvotes << @post

      @post.save
      @current_user.save

      redirect_to :back
      flash[:notice] = "Vote successfully recorded!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
