#!/bin/sh

# Remove any existing server process in case of dirty shutdown, with -f in case the file doesn't exist.
rm -f /app/tmp/pids/server.pid

echo "Installing libraries and creating database..."
# `bundle install` here rather than in Dockerfile,
#    so that we can cache its result in the bundle_cache container.
bundle install

# Yarn install here instead of in Dockerfile since it needs to come after bundle install.
yarn install

# Compile CSS and JS assets for production.
bundle exec rails assets:clobber
bundle exec rails assets:precompile

# Perform any database tasks needed.
bundle exec rails db:create db:migrate

echo '

       .,*******.        .******  .******.       .,*****,       ,*//(((//*,
       /#%%%%%%%#,      .(%%%%%/  /%%%%%%        /#%%%%#,  ,(%%%%%%%%%%%%%%#,
      ,#%%%%%%%%%(.     ,%%%%%#  ,%%%%%%/       ,#%%%%%/ .(%%%%%#((/***/((#*
      /%%%%%%%%%%%/    .(%%%%%*  (%%%%%#        /%%%%%#, /%%%%%#*
     ,#%%%%#,(%%%%%,   ,%%%%%#  ,%%%%%%(*******/#%%%%%(  *#%%%%%%#(*.
    ./%%%%%/ .#%%%%#.  (%%%%%*  (%%%%%%%%%%%%%%%%%%%%#,   ,(#%%%%%%%%%#(,
    ,#%%%%%   ,#%%%%# ,%%%%%(  ,%%%%%%(///////(#%%%%%(        ,/(#%%%%%%%(
   ./%%%%%/    /%%%%%/#%%%%%,  #%%%%%(.       /%%%%%#,            .(%%%%%#*
   ,%%%%%#     .(%%%%%%%%%%(. *%%%%%%*       ,#%%%%%(  ..         *#%%%%%#.
  .(%%%%%*      ,#%%%%%%%%#,  #%%%%%(.      ./%%%%%%. ,#%%%%%%%%%%%%%%%%(.
  ,%%%%%#        *#%%%%%%%/. *#%%%%#*       ,#%%%%%/  /##%%%%%%%%%%#(/,

           ___________    _      __
          / __/ __/ _ \  | | /| / /______ ____  ___  ___ ____
         / _/_\ \/ , _/  | |/ |/ / __/ _ `/ _ \/ _ \/ -_) __/
        /___/___/_/|_|   |__/|__/_/  \_,_/ .__/ .__/\__/_/
                                        /_/  /_/
'

# Start server.
bundle exec rails s
