## Overview

The proposed solution is a handful example of the good usage of BDD against android application with the usage of [Cucumber](https://cucumber.io/) and [Calabash](http://github.com/calabash/calabash-android)


### Installation

#### MacOS

Please Install *Xcode Commandline tools* and `gpg` before `rvm`

```
xcode-select --install
brew install gpg
```
On Unix systems you can do the following to append it to your system’s search path, if you’re using a bash-compatible shell:
* set ANDROID_HOME environment var to the Android SDK path (e.g. export ANDROID_HOME=/Users/your_user/Library/Android/sdk)


Please install [rvm](http://rvm.io/) with Ruby version 2.4.1 or higher
after that in checked out directory please do the following to install the dependencies:
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
```

Checkout and cd to repository contents, then do:

```
source /<your_local_dir>/.rvm/scripts/rvm
rvm use 2.4.1
gem install bundler
bundle install
```

### Tests

#### Running e2e tests
The tools used to run e2e tests are [Cucumber](https://cucumber.io/) and [Calabash](http://github.com/calabash/calabash-android). Configuration file `application.yml` is located in the project root. To run test execute the following command:
```
bundle exec calabash-android run apk/app-debug.apk -p android
```

Resign the application if needed:

    calabash-android resign <apk>


Sample test
-----------
```ruby
Feature: Login feature

  @android
  Scenario: As a valid first user I can log into QA app
    Given I'm on the homepage
    Then I enter my "percival@gmail.com" username
    Then I enter my "123456" password
    When I click on SIGN IN OR REGISTER button
    Then I see picture of the house
```

Sample cert file can be downloaded from the repo: [debug.keystore](https://github.com/kosiara/calabash-android-example-projects/raw/master/certs/debug.keystore)

copy the file to **/home/your_user/.android/debug.keystore**

Run calabash tests on multiple devices - specify device with ADB_DEVICE_ARG env variable:

    export ADB_DEVICE_ARG=<adb_device_serial> calabash-android resign <apk>     #OsX
    ADB_DEVICE_ARG=<adb_device_serial> calabash-android resign <apk>     #Ubuntu


Step definitions
----------------

[github - calabash-android](https://github.com/calabash/calabash-android/blob/master/ruby-gem/lib/calabash-android/canned_steps.md)

[developer.xamarin.com](https://developer.xamarin.com/guides/testcloud/calabash/calabash-predefined-steps)

[calabash-android-steps ruby files](https://github.com/calabash/calabash-android/tree/master/ruby-gem/lib/calabash-android/steps)


#### Other

The solution is also designed to save screenshots upon failure. They would be saved to root directory.
