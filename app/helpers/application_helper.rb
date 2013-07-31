module ApplicationHelper
  def title(page_title)
    content_for :title, "#{page_title} - Chattr"
  end
end
