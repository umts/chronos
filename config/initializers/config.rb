begin
  CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
rescue Errno::ENOENT
  CONFIG = {}
end

CONFIG.reverse_merge!(
  'lunch_start' => 6,
  'lunch_duration' => 0.5
)

CONFIG.freeze
