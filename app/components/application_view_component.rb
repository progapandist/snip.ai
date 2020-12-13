# frozen_string_literal: true

class ApplicationViewComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(*)
    # define @virtual_path for I18n.t shortcuts to work
    @virtual_path = [
      "components",
      self.class.name.sub("::Component", "").underscore.split("/")
    ].join(".")
  end
end
