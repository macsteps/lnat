class MarkdownBlogController < ApplicationController
  include MarkdownBlogHelper
  attr_reader :content

  def index
    posts = Dir.glob("#{Rails.root}/public/blog/*/*/*.md")
    @content = []
    posts.each do |post|
      discard, slug = post.split(/lnat_app\//)
      @content << slug
    end
  end

  def show
    slug = params[:id]
    md_content = File.read(slug)
    @content = md_to_html(md_content)
  end

end
