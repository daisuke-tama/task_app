class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(
      title: params[:title],
      start_day: params[:start_day],
      finish_day: params[:finish_day],
      one_day: params[:one_day],
      memo: params[:memo])
      if @post.save
        flash[:notice] = "新規作成が完了しました"
        redirect_to("/")
      else
        flash[:notice] = "作成に失敗しました"
        render("posts/new")
      end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.start_day = params[:start_day]
    @post.finish_day = params[:finish_day]
    @post.one_day = params[:one_day]
    @post.memo = params[:memo]
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/")
    else
      flash[:notice] = "編集に失敗しました"
      render("post/edit")
    end
  end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to("/")
  end
  
end
