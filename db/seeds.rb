
50.times do |i|
  Task.create!(title: "Task#{ i + 1 }", content: "testデータ", deadline_on: Date.current + i, priority: Task.priorities.values.to_a.sample, status: Task.statuses.values.to_a.sample)
end

