# frozen_string_literal: true

class Prompt::Component < ApplicationViewComponent
  attr_reader :path

  def initialize(path:)
    @path = path
  end
end
