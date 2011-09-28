# Fake Foo API #

## Synopsis ##

A fake API for consumption by ActiveResource. Useful for manually testing code that works with ActiveResource objects in a generic way.

Swap out for [FakeWeb](http://fakeweb.rubyforge.org/) in your tests.

## Unleash an army of foos ##

    rm -rf db/*.sqlite3
    rake db:migrate
    rake db:seed
