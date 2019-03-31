class AppDecorator < SimpleDelegator
  attr_reader :view_context
  attr_accessor :record

  def initialize(record, view_context)
    super record
    @record, @view_context = record, view_context
  end
end