module PostsHelper
  def answered(p)
    "Answered" if p.comments_count > 0
  end

  def display_gender(p)
    case p.gender
    when 0
      "其他"
    when 1
      "男"
    when 2
      "女"
    end
  end

  def display_public(p)
    if p.public
      "同意!"
    else
      "不同意!"
    end
  end
end
