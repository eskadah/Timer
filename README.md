# Hello 200 (Client App)

Discover healthy eating, one choice at a time.

## Requirements

* RubyMotion 2.37
* ImageMagick 6.8.6-3

## Initial Setup

```bash
# allow caching of multiple ruby motion versions
sudo motion update --cache-version=2.37

# general setup

sudo gem update --system
sudo gem install cocoapods
#rehash if using rbenv
rbenv rehash

bundle install
pod setup
rake pod:install
```
# Application resource file

Copy `resources/app.example.yml` to `resources/app.yml` and replace placeholders
with your specific values

## Running the App

* Run the Hello 200 server locally

```bash
rake
```
## Running the Tests

Hello 200 has two testing suites. One that covers the standard (mostly unit)
tests, and one that is for the overall unit testing of the application.  The
unit testing uses motion-frank is a little more involved than just running a
rake command.

### Running standard tests

```bash
rake spec
```
### Running Frank Tests

You must first configure your `API_FIXTURE_DIR` settings in your `resources/app.yml` to point to your local Hello 200 server instance directory

example:
```ruby

frank:
    API_FIXTURE_DIR: '/Users/some-meyouhealth-employee/code/bamboo-server/frank_fixtures'
```

Install ios sim from your package manager (homebrew, macports,etc)

   ```brew
      install ios-sim
      ```

Then in your rails server directory for the Hello 200 product run the `frank_listener`.

```bash
./frank_lisenter.sh
```

After the frank listener is running, you can then run the frank tests on your
ios project

```bash
rake frank
```
