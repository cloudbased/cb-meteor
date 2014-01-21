#
# Basic integration tests using phantom.js, mocha and webspecter.
# Take a look here: https://github.com/jgonera/webspecter for docs.
#

feature "Meteor todo list", (context, browser, $) ->
  before (done) -> browser.visit 'http://localhost:3000/', done

  it "Inspects the basics", (done) ->
    wait.until $("#new-todo").is.present, for: 3000,  ->     
        $('title').present.should.be.true
        $(text: 'Todo Lists').present.should.be.true        
        done()

  it "Checks visibility", (done) ->
    wait.until $("#new-todo").is.present, for: 3000,  ->     
        $(text: 'Show:').present.should.be.true        
        $(text: 'Show:').visible.should.be.true        
        $("#new-list").present.should.be.true
        $(".todo-text").visible.should.be.true
        $("#side-pane").visible.should.be.true
        done()        

  it "Checks Ada is visisble", (done) -> 
      wait.until $("#new-todo").is.present, for: 3000,  ->     
        $(".todo-text").text.should.include "Ada"                
        done()
