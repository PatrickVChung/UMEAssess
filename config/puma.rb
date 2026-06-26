threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", 3000)

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# --- THE FIXES START HERE ---

# 1. Dynamically detect the environment (defaults to development)
rails_env = ENV.fetch("RAILS_ENV") { "development" }
environment rails_env

app_dir = File.expand_path("..", __dir__)

# 2. Only use production-style workers and sockets if NOT in development/test
if %w[staging production].include?(rails_env)
  workers ENV.fetch("WEB_CONCURRENCY") { 2 }
  threads 1, 6
  bind "unix://#{app_dir}/tmp/sockets/puma.sock"
  pidfile "#{app_dir}/tmp/pids/puma.pid"
  stdout_redirect "#{app_dir}/log/puma.stdout.log",
                  "#{app_dir}/log/puma.stderr.log",
                  true
end
