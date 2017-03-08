json.extract! lesson_reference, :id, :title, :url, :lesson_id, :created_at, :updated_at
json.url lesson_reference_url(lesson_reference, format: :json)