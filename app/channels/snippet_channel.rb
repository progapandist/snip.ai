class SnippetChannel < ApplicationCable::Channel
  def subscribed
    stream_from "snippet_stream_#{session_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
