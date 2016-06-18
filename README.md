#  Basic Ruby + PostgreSQL CI starter project

Setting up Ruby CI, cleanly and correctly, is not the easiest thing to do by hand. So here we have done it for you. 
Press the button and it wll set this up the right way for your next Ruby project, and also includes PostgreSQL - for fun.

This basic Ruby project demonstrates:

* using CloudBees Ruby and PostgreSQL addons
* Bundler configuration and use
* Jenkins configuration
* RSpec spec execution and results (via ci_reporter gem)
* Tumbler configuration and use for gem production
* artifact archiving in Jenkins

If you don't have a CloudBees account - sign up with github:
<button onClick="javascript:window.location='https://grandcentral.cloudbees.com/authenticate/start?provider=github&login_redirect=/';"><img src="https://grandcentral.cloudbees.com/images/github-icon_40.png" /></button>

Once you have an account, click on the novelty oversized button:

<a href="https://grandcentral.cloudbees.com/?CB_clickstart=https://raw.github.com/CloudBees-community/rubyci-clickstart/master/clickstart.json"><img src="https://d3ko533tu1ozfq.cloudfront.net/clickstart/deployInstantly.png"/></a>


# Running in CloudBees Jenkins

    ENVIRONMENT=cloudbees ./bin/run-ci

# Running locally

    ENVIRONMENT=local ./bin/run-ci
