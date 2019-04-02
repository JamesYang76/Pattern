class BasePresenter < SimpleDelegator
  def initialize(object, template)
    super(object)
    @object, @template = object, template
  end

  private

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end

=begin
  def markdown(text)
    Redcarpet.new(text, :hard_wrap, :filter_html, :autolink).to_html.html_safe
  end
=end

=begin
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end
=end
end
