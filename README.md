![Build Status](https://codeship.com/projects/69a45620-6ba7-0134-f930-7ea83503a0a9/status?branch=master)
![Code Climate](https://codeclimate.com/github/noahmilstein/cinephile.png)
![Coverage Status](https://coveralls.io/repos/noahmilstein/cinephile/badge.png)

# Cinephile
Cinephile is a code bootcamp class project to demonstrate full stack web dev skills
using git version control and work flow. The project uses the following components:

* Ruby on Rails
* CarrierWave
* React
* AJAX
* Javascript
* Foundation

## Demo
For a demo of the site, please visit our Heroku page here: [Cinephile](http://cinephile-launch.herokuapp.com/).


## Setup
The app uses Ruby 2.3.1 and was developed on Ruby on Rails 5.0.  React is served up
on webpack 1.13.2.

To install, please run the following in your terminal:

### First, set up Rails
`git clone https://github.com/noahmilstein/cinephile.git`
`cd cinephile`
`bundle install`
`rake db:create`
`rake db:migrate`

### Now set up webpack
`npm install`

To store image attachments, you will need to sign up for an Amazon Web Services.
Once you have your AWS secret keys, create a .env file in the root directory,
and add your AWS secret keys with the following format:

```AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY>
AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_ACCESS_KEY>
S3_BUCKET=<YOUR_S3_BUCKET>```

## Running the application
To run Cinephile, please run the following commands in your terminal from the
`cinephile` directory:

`rails s`
`npm start`

Now open your browser and enter `localhost:3000` in your address bar.

## Testing
To run the test suite, please enter the following command from the `cinephile`
root directory:

`rspec`
