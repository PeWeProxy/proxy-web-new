set :repository,  "git://gitbus.fiit.stuba.sk/pewe-proxy-team-project/proxy-web-new.git"
server "peweproxy-staging.fiit.stuba.sk", :app, :web, :db, :primary => true
