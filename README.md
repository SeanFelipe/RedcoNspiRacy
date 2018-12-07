


An implementation of the Java LibGDX gaming library (libgdx.com) with JRuby.

Why?

* It's really fun. Shaders are wicked cool. (shadertoy.com)
* Ruby is awesome. If you haven't tried the koolaid give it a swig sometime.
* JRuby has so far been surprising stable.
* Implementation of Java has been very intuitive ... astonishingly not astonishing.
* Leveraging the LibGDX ecosystem's ability to compile for desktop + android + ios, with some work, we could make a nice little React Native competitor.


Run:

install RVM
clone repo
cd RedcoNspiRacy
(rvm will setup your gem environment)
bundle
3






REDC NEXT GOALS

- faster startup
--> how might I profile the startup phase and what piece takes how long?
--> are my java imports slowing things down?

- hot reloading of code ala reactjs
--> make a code change, maybe do another trigger, and code hot swaps

- breakpointing with pry or other tools
--> getting opengl context error


