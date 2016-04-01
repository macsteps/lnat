class MarkdownBlogController < ApplicationController
  include MarkdownBlogHelper
  attr_reader :content

  def index
    posts = Dir.glob("#{Rails.root}/public/*/*/*.md")
    @content = Array.new
    posts.each do |post|
      discard, slug = post.split(/lnat_app\//)
      slug_fields = []
      slug_fields = slug.match(/(\w+?\/)(\w+?)\/(\d{4})\/(\S+?\.md)/)
      category = slug_fields[2]
      year = slug_fields[3]
      file_name = slug_fields[4]
      title = file_name.split(/-/).map(&:capitalize).join(' ').gsub(/\.md$/, '')
      slug_final = "public/#{category}/#{year}/#{file_name}"
      slug_final.html_safe
      logger.debug "slug final: #{slug_final}"
      @content << [title, slug_final.html_safe]
    end
  end

  def show
    file_path = "#{Rails.root}/" + params[:path] + ".md"
    md_content = File.read(file_path)
    @content = md_to_html(md_content)
  end

end
