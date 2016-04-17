class MarkdownBlogController < ApplicationController
  include MarkdownBlogHelper
  attr_reader :content

  def index
    posts = Dir.glob("public/*/*/*.md")
    @content = Array.new
    posts.each do |post|
      title, slug_final = get_slug_final(post)
      # first line will be an image
      first_line = File.foreach(post).first(1)
      # change the CSS class for the blog index page
      first_line = first_line.join("").to_s.gsub(/col-md-offset-3 blog-main-img/, 'blog-excerpt-img')
      next if first_line.match(/^draft/)
      # only using the image as an excerpt
      excerpt = md_to_html(first_line)
      @content << [title, slug_final, excerpt]
    end
  end

  def show
    file_path = "#{Rails.root}/" + params[:path] + ".md"
    md_content = File.read(file_path)
    @content = md_to_html(md_content)
  end

  private

    # get the title and slug. note that the slug is not actually modified here
    # and only the title field is currently used, but other fields are available.
    def get_slug_final(slug)
      slug_fields = []
      slug_fields = slug.match(/(\w+?\/)(\w+?)\/(\d{4})\/(\S+?\.md)/)
      category = slug_fields[2]
      year = slug_fields[3]
      file_name = slug_fields[4]
      title = file_name.split(/-/).map(&:capitalize).join(' ').gsub(/\.md$/, '')
      slug_final = "public/#{category}/#{year}/#{file_name}"
      return title, slug_final
    end

end
