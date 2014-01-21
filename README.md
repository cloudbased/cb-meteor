#  Meteor clickstart with MongoDB and continuous deployment (alpha)

Note: Meteor is a very fast moving target - expect this to change over time. Feel free to fork/break/fix.

MeteorJS is a realtime client and server JS framework for building apps very very quickly, and deliberately blurs the line between server and client code so you can move quickly (it is all javascript or coffeescript).

"Meteor, an ultra-simple, database-everywhere, data-on-the-wire, pure-Javascript web framework"
"Meteor is an open-source platform for building top-quality web apps in a fraction of the time, whether you're an expert developer or just getting started." You can read more about it <a href="http://meteor.com">here</a>.

Press the big button to continue:

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/michaelneale/meteor-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>


Take a <a href='https://github.com/CloudBees-community/meteor-clickstart/tree/master/todos'>peek</a> at the code if you like.


When you run this clickstart, it will do the following:
* create a new mongodb instance (on mongohq for you) 
* a Jenkins build that runs a real browser integration test against the app (phantomjs),
* Deploy the app to cloudbees ready to go, if the tests pass (and they will, the first time). 

After that point, you can clone your new private repo, modify - and push changes ! Away you go. The aim is to get you going with an end to end pipeline from source to deployment with testing, a build and a database all ready to go, no more servers.
CloudBees takes care of everything else, and you can scale up as needed (both in terms of yoru development team, and runtime!)




CloudBees is a complete platform as a service - all your bits are hosted (even your source code and building).

Running this clickstart will grab the freshest version of meteor (you can customise the build script later however you want).


The tech at play in this clickstart: 

<img src='http://phantomjs.org/images/phantomjs-logo.png'>
<img src='http://media.mongodb.org/logo-mongodb.png'>
<img src='http://meteor.com/screencast.gif'>



# To develop locally

Clone this:
* cd this repo/todos
* $ meteor 

Browse to localhost:3000 (that is all !)

When you push your changes, the integration test will run, but you can run it locally if you want:

You will need meteor installed on your system.

Running integration testing locally: 
* install nodejs
* install phantomjs (npm install phantomjs works)
* git clone https://github.com/jgonera/webspecter.git --recursive
* add phantomjs, node and webspectre to your path
* Start meteor (as above)
* $ webspectre tests/integration.coffee


# So what next
Well once you have this running - you can modify it to be the app you want. 
The MongoDB app is bound to your application, and any change you make triggers the Jenkins build automatically. 
For those more keen on browser testing - you can try the saucelabs add on to get a wide variety of browser/OS 
testing via selenium-webdriver.


# Upgrading meteor (or Node.js)
Meteor is currently quite fickle with the version of node.js it works with - and is rarely the latest. 
If you upgrade meteor - work out what version of node.js is needs, and then follow the instructions here (http://stackoverflow.com/questions/18436242/i-want-to-customise-my-own-version-of-node-js-for-cloudbees/) for how to get a specific version of node.js.

# More about meteorJS? 

You can read more on the Meteor homepage, but it is worth noting how simple it can be, for client/server apps. 
For example take a look at <a href='https://github.com/meteor/meteor/tree/master/examples/leaderboard'>this</a> 
simple app - all there in one file. The MongoDB collections are represented as first class "objects" in your code, 
changes are detected and pushed ot the client, HTML refers to these collections in templates. 
ie: 

<code>
Players = new Meteor.Collection("players");
</code>

This defines a collection, which is also a MongoDB collection. When you put entries in there, 
they appear both in the UI (via template binding) and the DB. 
In that example, data is inserted like this: 

<code>
Players.insert({name: names[i], score: Math.floor(Random.fraction()*10)*5});
</code>

It can be that simple. Press the button above, try it out for yourself.

<a href="http://meteor.com/">Read on.</a>
