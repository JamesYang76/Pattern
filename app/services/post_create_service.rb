class PostCreateService < ApplicationService
  def initialize(params:)
    @post = Post.new(params)
  end

  def call
    OpenStruct.new(success?: @post.save, post: @post, errors: @post.errors)
  end

  private

  attr_reader :post
end