class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.friendly.find(params[:id])
  end

  def create
    @prompt = Prompt.find_or_create_by(prompt_params) # generate a slug for new record
    SnippetJob.perform_later(@prompt, session.id.to_s)
  end

  private

  def prompt_params
    params.require(:prompt).permit(:text)
  end
end
