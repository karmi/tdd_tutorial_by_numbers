Test-Driven Development in Ruby by Numbers
==========================================

A code tutorial to demonstrate test-first (or test-driven) in Ruby step-by-step. The steps are saved into Git branches and commit messages contain some additional information. This should accompany an article I probably never will got to write :)


The Assignment
--------------

The assignment is the most simple one: _Write utility method to convert numerals (like 1) to number names (like 'two')_


The Workflow
------------

There are Rake tasks provided for easy stepping through the tutorial.

To start (checkout step branches and switch to step one), just type:

    $ rake start

To switch to next step, type:

    $ rake step


Requirements
------------

* Ruby
* Rubygems
* Git 1.6.4
* Shoulda gem (`$ gem install Shoulda`)
* Optionally, RedGreen gem for colored test output  (`gem install redgreen`)
* Optionally, Term::ANSIColor gem for colored Rake output (`gem install term-ansicolor`)


Credits
-------

Copyright (c) 2009 Karel Minarik [[karmi](http://www.karmi.cz)]. Released under MIT license.
