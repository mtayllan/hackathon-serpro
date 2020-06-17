# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :organization

  enum kind: {
    phone: 1,
    whatsapp: 2,
    email: 3,
    other: 4
  }
end
