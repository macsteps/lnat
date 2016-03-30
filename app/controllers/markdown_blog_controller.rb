class MarkdownBlogController < ApplicationController
  include MarkdownBlogHelper
  attr_reader :content

  def index
    posts = Dir.glob("#{Rails.root}/public/blog/*/*/*.md")
    @content = Array.new
    posts.each do |post|
      discard, slug = post.split(/lnat_app\//)
      slug_fields = []
      slug_fields = slug.match(/(\w+?\/\w+?\/)(\w+?)\/(\d{4})\/(\d{4})-(\d{2})-(\d{2})-(\S+?)\.md/)
      title = slug_fields[7].split(/-/).map(&:capitalize).join(' ')
      @content << [title, slug]
    end
  end

  def show
    slug = params[:id]
    md_content = File.read(slug)
    @content = md_to_html(md_content)
  end

end
