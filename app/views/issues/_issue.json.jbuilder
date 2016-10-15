json.extract! issue, :id, :title, :body, :user_id, :dept_status, :student_status, :status, :bounce_counter, :created_at, :updated_at
json.url issue_url(issue, format: :json)