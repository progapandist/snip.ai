class SnippetJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(prompt, session_id)
    snippet = CreateSnippet.new(prompt, AiCompletionService).call
    if snippet.persisted?
      prompt.save
      snippet.update(prompt: prompt)
    end
    channel = cable_ready["snippet_stream_#{session_id}"]
    channel.inner_html(
      selector: "#snippet-code", # required - string containing a CSS selector or XPath expression
      html: ApplicationController.renderer.render(CodeBlockComponent.new(snippet.code))
    )
    channel.console_log(
      message: ApplicationController.renderer.render(CodeBlockComponent.new(snippet.code))
    )
    channel.remove(
      selector: "#form-submit",
      focus_selector: "#form-submit"
    )
    channel.broadcast
  end
end
