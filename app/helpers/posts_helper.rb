module PostsHelper
  # ハッシュタグ機能に必要らしい
  def render_with_tags(tag_body)
    tag_body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post/tag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end
