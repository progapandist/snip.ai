# frozen_string_literal: true

class PromptWaitComponent < ViewComponent::Base
  attr_reader :prompt

  def initialize(prompt:)
    @prompt = prompt
  end
end
