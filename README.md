# Gneiss Rocks

## Great pun, but what is it for?
My background is in Geology/Geophysics. I have lurked around many a corner hoping that someone would bring up the subject of rocks, so that I might burst into action much like Tony Wonder does in Arrested Development. Never has such a case happened. Instead, I do my best to inform a curious mind about the rock formations around us.

Sadly, it is not always the case for one to have the friendly neightborhood geologist to turn to for information. For the untrained eye, it is difficult to recognize and identify rocks in the field. I wanted to make a rock identifier app so that the average student, rock enthusiast, or nature lover could learn more about our Earth's history.

## Requirements

For development, you will only need quite a few things installed on your environment to get going.

* Rails 5.1.3
* Ruby 2.4.1
* Python 2.7x
* Google SDK

The [docs](https://cloud.google.com/sdk/docs/) for Google Cloud SDK are pretty comprehensive and I suggest you start there for getting everything set up on your machine.


## Install

```
$ git clone git@github.com:sarahdactyl71/gneiss-rocks.git
```
```
$ cd gneiss-rocks
```
```
$ bundle install
```

Please note this is assuming everything was installed and set up properly with Google SDK.

You wil need a set of application credentials for the project specific to your google user account. They should be a JSON file with a lot of private information such as your private key, project name, client id etc. You will need to set a file up in your root directory called

```
gneiss-rocks-creds.json
```
with the JSON file you created in your google account in it. This will give you the proper permissions to access the Google Vision API.

## Testing
  `rspec`

  If you would like to see the test coverage run all the tests and then paste

  `open coverage/index.html`

  into your terminal. This should open a file in your browser with and in depth look at what the tests are covering.
