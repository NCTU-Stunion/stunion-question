class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_presence_of :name, :depart, :email, :title, :question
  validates_inclusion_of :gender, :in => [0, 1, 2]
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates_length_of :question, :minimum => 10

  def email_subject
    "#{self.name} 同學您好！回覆您的問題『#{self.title}』"
  end

  def email_greeting
    "#{self.name} 同學您好：
    我們已經收到您的問題，經過集思廣益的研商後您的問題：#{self.title}
    我們做出了以下的回答：
    ----------------------------------------------------------------------------------------------------
    "
  end

  def email_closing
    if self.public
      pub = "有可能"
    else
      pub = "不會"
    end
    "----------------------------------------------------------------------------------------------------
    另外，您的問題 #{pub} 被列為精選問題，
    於我們的粉絲專頁 <a href=https://www.facebook.com/NctuStUnion>https://www.facebook.com/NctuStUnion</a> 上刊登
    敬請訂閱學聯會粉專~
    所有的重要訊息與福利活動都會由我們完整通知

    交通大學20th學聯會 敬上
    ----------------------------------------------------------------------------------------------------
    註：本信由新生提問回覆系統進行回覆，請勿直接進行回覆。
    如有任何問題請寄信至<a href=mailto:stu.nctu@gmail.com>stu.nctu@gmail.com</a>或利用FB私訊紛絲專頁，謝謝。
    "
  end
end
