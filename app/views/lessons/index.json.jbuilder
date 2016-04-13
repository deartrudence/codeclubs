json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :duration_in_seconds, :level, :description, :curriculum_concepts, :prep, :programming_concepts, :content, :extensions, :answers, :video_link, :profile_id
  json.url lesson_url(lesson, format: :json)
end
