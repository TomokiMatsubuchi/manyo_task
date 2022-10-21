class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :deadline_on, presence: true
  validates :priority, presence: true
  validates :status , presence: true

  enum priority:{'高':2, '中':1, '低':0}
  enum status:{'未着手':0, '着手中':1, '完了':2}

  scope :search_status, -> (params){where(status: Task.statuses[params["search"]["status"]])}
  scope :search_title, -> (params){where('title LIKE ?', "%#{params["search"]["title"]}%")}
  scope :desc_create, -> {order("created_at DESC")}
  scope :deadline, -> {order("deadline_on ASC")}
  scope :priority, -> {order("priority DESC")}
end
