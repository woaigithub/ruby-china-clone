module ApplicationHelper

  def full_title(title)
    if title
      "ruby-china-clone | #{title}"
    else
      "ruby-china-clone"
    end
  end
end
