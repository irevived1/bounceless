json.extract! issue, :id, :title, :body, :student_id, :dept_status, :student_status, :status, :bounce_counter, :dept_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)