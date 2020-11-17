#!/bin/sh

# Remove any existing server process in case of dirty shutdown, with -f in case the file doesn't exist.
rm -f /app/tmp/pids/server.pid

FIRST_RUN_FLAG_FILE=script/first_run_complete.tmp
if [ -f $FIRST_RUN_FLAG_FILE ]
then echo "$FIRST_RUN_FLAG_FILE detected, skipping library installation..."
else echo "Booting for the first time, installing libraries and creating database..."
  # `bundle install` here rather than in Dockerfile,
  # so that we can cache its result in the bundle_cache container.
  bundle install

  # Yarn install here instead of in Dockerfile since it needs to come after bundle install.
  yarn install

  # Perform any database tasks needed.
  bundle exec rails db:create db:migrate

  echo "This is an autogenerated file that is created when the ESR Wrapper is run for the first time. It's used as a flag to speed up boot times after the initial boot." > $FIRST_RUN_FLAG_FILE
fi

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
