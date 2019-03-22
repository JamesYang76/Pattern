class PostCreateService < Service
  def initialize(post)
    @post = post
  end

  def call
    OpenStruct.new(success?: @post.save, post: @post, errors: @post.errors)
  end

  private

  attr_reader :post
end