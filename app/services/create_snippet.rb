class CreateSnippet
  def initialize(prompt, completion_service)
    @prompt = prompt
    @completion_service = completion_service
  end

  def call
    return Snippet.new if @prompt.text.empty?
    snippet = Snippet.find_or_initialize_by(text: @prompt.text)
    if snippet.code.blank?
      snippet.update(
        code: @completion_service.new(@prompt.text).call,
        text: @prompt.text
      )
    end
    snippet
  end
end
