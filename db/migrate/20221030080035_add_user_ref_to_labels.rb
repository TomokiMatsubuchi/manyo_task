class AddUserRefToLabels < ActiveRecord::Migration[6.0]
  def change
    add_reference :labels, :user, index: true, foreign_key: true
  end
end
