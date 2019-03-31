class UserDecorator < ApplicationDecorator
  delegate_all
  #decorates_finders

  def full_name
    first_name + ' ' + last_name
  end

  def join_time
    object.created_at.strftime("%A, %B %e")
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
