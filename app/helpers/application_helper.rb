module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    Rails.logger.debug("klass = #{object.class}Presenter")
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
