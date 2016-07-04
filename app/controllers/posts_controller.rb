class PostsController < ApplicationController
  before_filter :authenticate_admin!, :only => [ :index, :show, :destroy ]
  before_action :find_post, :only => [ :show, :edit, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.new
    @comments = @post.comments.all.includes(:admin)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = success_msg(@post)
      redirect_to root_path
    else
      flash[:error] = "請修改問題格式！\n（各格皆為必填，問題需大於10個字！）"
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(:name, :gender, :depart, :email, :title, :question, :public)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def success_msg(post)
    if post.public
      pub = "會"
    else
      pub = "不會"
    end
    "#{post.depart} | #{post.name} 同學您好 您的問題已經送出！
    標題： #{post.title}
    信箱： #{post.email}
    內容： #{post.question}
    我們將#{pub}公開您的問題！

    學聯會會儘快回復您的問題！
    謝謝您使用此提問系統！
    "
  end
end
