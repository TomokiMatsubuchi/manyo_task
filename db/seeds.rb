taro = User.create!(name:'taro', email: 'tatotarotaros@sample.com', password: 'password', password_confirmation: 'password')
current_hanako = User.create!(name: 'hanako', email: 'hanahanahanakosan@sample.com', password: '1234567', password_confirmation: '1234567', admin: "yes")

50.times do |i|
  Task.create!(title: "hanako_task_title_#{ i + 1 }", content: "testデータ", deadline_on: Date.current + i, priority: "中", status: Task.statuses.values.to_a.sample, user_id: current_hanako.id)
  Task.create!(title: "task_title_#{ i + 1 }", content: "testデータ", deadline_on: Date.current + i, priority: "中", status: Task.statuses.values.to_a.sample, user_id: taro.id)
end

#Task.priorities.values.to_a.sample これはpriorityをランダムに取り出す際に必要

