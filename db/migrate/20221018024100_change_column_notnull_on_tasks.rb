class ChangeColumnNotnullOnTasks < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tasks, :deadline_on, false
    change_column_null :tasks, :priority, false
    change_column_null :tasks, :status, false
  end
end
