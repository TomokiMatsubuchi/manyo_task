
Task.create!(title: "task_title_11", content: "testデータ", deadline_on: "2020-10-10", priority: "高", status: Task.statuses.values.to_a.sample, user_id: 1)

50.times do |i|
  Task.create!(title: "task_title_#{ i + 1 }", content: "testデータ", deadline_on: Date.current + i, priority: "中", status: Task.statuses.values.to_a.sample, user_id: 1)
end

#Task.priorities.values.to_a.sample これはpriorityをランダムに取り出す際に必要

