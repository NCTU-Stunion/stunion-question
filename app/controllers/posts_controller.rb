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
      redirect_to '/form' #if root_path then after posting the question, it will be routed back to stunion.edu.tw instead of stunion.edu.tw/questions
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
      pub = "您願意公開您的問題！"
    else
      pub = "我們將不會公開您的問題！"
    end
    "#{post.depart} | #{post.name} 同學您好 您的問題已經送出！
    標題： #{post.title}
    信箱： #{post.email}
    內容： #{post.question}
    #{pub}

    學聯會會儘快回復您的問題！
    謝謝您使用此提問系統！
    "
  end
end
