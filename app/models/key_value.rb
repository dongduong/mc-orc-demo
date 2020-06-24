class KeyValue < ApplicationRecord
  ## Associations
  belongs_to :accident_invoice, foreign_key: :invoice_id
end
