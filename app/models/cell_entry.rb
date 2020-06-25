class CellEntry < ApplicationRecord
  ## Associations
  belongs_to :table_entry, foreign_key: :table_entry_id
end
