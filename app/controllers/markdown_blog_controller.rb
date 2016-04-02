class MarkdownBlogController < ApplicationController
  include MarkdownBlogHelper
  attr_reader :content

  def index
    posts = Dir.glob("#{Rails.root}/public/*/*/*.md")
    @content = Array.new
    posts.each do |post|
      discard, slug = post.split(/lnat_app\//)
      title, slug_final = get_slug_final(slug)
      first_five = File.foreach(post).first(1)
      first_five = first_five.join("").to_s.gsub(/col-md-offset-3 blog-main-img/, 'blog-excerpt-img')
      excerpt = md_to_html(first_five)
      logger.debug "EXCERPT:#{excerpt}"
      @content << [title, slug_final, excerpt]
    end
  end

  def show
    file_path = "#{Rails.root}/" + params[:path] + ".md"
    md_content = File.read(file_path)
    @content = md_to_html(md_content)
  end

  private

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
