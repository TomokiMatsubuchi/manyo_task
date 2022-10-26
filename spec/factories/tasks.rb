# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # 「task」のように実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを作成されます
  factory :task do
    title { '書類作成' }
    content { '企画書を作成する。' }
    created_at {'2025-02-18'}
    deadline_on {'2025-02-19'}
    priority {'中'}
    status {'未着手'}
    association :user, email: '2345agsg67@samile.com'
  end

  # 作成するテストデータの名前を「second_task」とします
  # 「second_task」のように存在しないクラス名をつける場合、`class`オプションを使ってどのクラスのテストデータを作成するかを明示する必要がります
  factory :email_task, class: Task do
    title { 'メール送信' }
    content { '顧客へ営業のメールを送る。' }
    created_at {'2025-02-18'}
    deadline_on {'2025-02-19'}
    priority {'中'}
    status {'未着手'}
    association :user, email: '234567@samile.com'
  end

  factory :first_task, class: Task do
    title { 'first_task' }
    content { '企画書を作成する。' }
    created_at {'2025-02-18'}
    deadline_on {'2025-02-18'}
    priority {'中'}
    status {'未着手'}
    association :user, email: '234567ag@samile.com'
  end

  factory :second_task, class: Task do
    title { 'second_task' }
    content { '企画書を作成する。' }
    created_at {'2025-02-17'}
    deadline_on {'2025-02-17'}
    priority {'高'}
    status {'着手中'}
    association :user,  email: '2345sagasg7@samile.com'
  end

  factory :third_task, class: Task do
    title { 'third_task' }
    content { '企画書を作成する。' }
    created_at {'2025-02-16'}
    deadline_on {'2025-02-16'}
    priority {'低'}
    status {'完了'}
    association :user,  email: '2345gasg67@samile.com'
  end
  factory :fainal_task, class: Task do
    title {"task_title_11"}
    content {"testデータ"}
    deadline_on {"2020-10-10"}
    priority {"高"} 
    status {Task.statuses.values.to_a.sample}
    association :user, email: '23456aaa7@samile.com'
  end
end