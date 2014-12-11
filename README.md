[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/aharpole/inquirator)

Inquirator
============

Inquirator is a tool that allows managers to run their teams more effectively by getting their teams in the habit of responding to questions on a weekly schedule.

This isn't a tedious employee feedback from asking you to rate your coworkers on a scale of 1 to 5; it's dead simple to use, and team members interact with the app through email; no user accounts need to be created. 

## Deploying

You can easily deploy to Heroku using the deploy button above. You need to set the app up with an email service provider like [Mandrill](http://mandrillapp.com).

You need to set the following environment variables:

Environment Variable | Value
---------------------| ------
`DOMAIN` | The domain your app lives on. For example, `example.com`
`HOST` | The URL for your app. `http://example.com`
`SMTP_SERVER` | The address for the SMTP server. `smtp.example.com`
`MANDRILL_USERNAME` | the username to use for SMTP auth
`MANDRILL_PASSWORD` | the password to use for SMTP auth
