# frozen_string_literal: true

class CodeBlockComponent < ViewComponent::Base
  attr_reader :code

  def initialize(code)
    @code = code
  end

  private

  def markdown
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(@code, *options).to_html.html_safe
  end
end
