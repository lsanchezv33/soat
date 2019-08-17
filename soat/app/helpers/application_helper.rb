# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  # Document type Enum from users
  def document_types
    User.document_types.keys
  end
end
