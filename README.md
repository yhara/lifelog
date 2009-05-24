LifeLog
=======

Install
-------

    $ sudo gem install ramaze datamapper do_sqlite3
    $ sudo gem install yhara-lifelog

How to use
----------
    $ lifelog \[options]

options:

* --config PATH : from where configuration is loaded
  (default: ~/.lifelog.rb)
* --db PATH : where sqlite3 database is put
* --port N : port of server
* --version : show version
* --help : show information of options
* --from-001 : if you are using VERSION=0.0.1,
  use this option for first time

then open [http://localhost:7012/](http://localhost:7012/)
in your browser.

Config file
-----------

Config file is put in ~/.lifelog.rb by default
(you can specify its path by --config option).

It's just a Ruby script file, so you can write
any code to change behavior of application.

