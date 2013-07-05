REDIS_DB_ENVIRONMENTS = {
  'production'    => 0,
  :production     => 0,

  'development'   => 1,
  :'development'  => 1,

  'test'          => 2,
  :test           => 2
}

# ensure ENV['RACK_ENV'] is set to 'test', 'development', or 'production 'in order to select a database for the running environment
REDIS_URI = ENV["REDISTOGO_URL"] || ENV["REDIS_URL"] || "redis://localhost:6379/"
REDIS_DB = REDIS_DB_ENVIRONMENTS[ (ENV["RAILS_ENV"] || :development) ]

uri = URI.parse( REDIS_URI )

REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password) rescue nil
REDIS.select REDIS_DB unless REDIS.nil?

REDIS4GECODER = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password) rescue nil
REDIS4GECODER.select (3 + REDIS_DB) unless REDIS4GECODER.nil?

puts "\nredis is not running on #{uri}\n!!!" if REDIS.nil?
puts "\nredis geocoder cache is not running on #{uri}\n!!!" if REDIS4GECODER.nil?