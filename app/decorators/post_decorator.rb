class PostDecorator < AppDecorator

  def initialize(post, view_context)
    super post, view_context
  end

  def printed_title
    title.upcase
  end

  def formatted_publisheday
    created_at.strftime("%d %b %Y")
  end

  def published_badge
    view_context.content_tag :span, "Published", class: "badge badge-success" if published?
  end
end