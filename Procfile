web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -c 2
release: bundle exec rake db:migrate
