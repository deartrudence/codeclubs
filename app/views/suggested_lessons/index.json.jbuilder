json.array!(@suggested_lessons) do |suggested_lesson|
  json.extract! suggested_lesson, :id, :lesson_id, :suggested_lesson_id
  json.url suggested_lesson_url(suggested_lesson, format: :json)
end
