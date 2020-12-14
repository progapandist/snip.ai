class PromptsController < ApplicationController
  def create
    @prompt = Prompt.new(prompt_params)
    render PromptWaitComponent.new(prompt: @prompt)
  end

  private

  def prompt_params
    params.require(:prompt).permit(:text)
  end
end
