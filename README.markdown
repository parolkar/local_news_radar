LocalNewsRadar
==============

LocalNewsRadar can periodically scan news for your local area like a spider and store it in your database so that you can use your existing model (which has lat,lng attributes) and retrieve news around its location.

You can look at [sample app](http://cloud.github.com/downloads/parolkar/local_news_radar/local_news_sample_app.tgz "Sample App1")

### What's so special here?

* Its one interface to many local news api
* It has automatic scheduling of its scanning of news update which doesnt interfere in your async code.
* What more do you need?

Dependency:
 
* gem : rufus-scheduler (2.0.1)
* rails version: 2.3.2+


Copyright (c) 2009 Abhishek Parolkar, released under the MIT license
