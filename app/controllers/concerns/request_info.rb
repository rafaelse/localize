# frozen_string_literal: true

module RequestInfo extend ActiveSupport::Concern

  private
  def json_request?
    request.format.json?
  end
end
