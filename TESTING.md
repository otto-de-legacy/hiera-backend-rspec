# Prerequisites
To develop on this gem, you must the following installed:
* a sane Ruby 2.0+ environment with `bundler`
```shell
$ gem install bundler
```


# Getting Started
1. Clone the git repository from Github:
```shell
$ git clone git@github.com:otto-de/hiera-backend-rspec.git
```
2. Install the dependencies using Bundler
```shell
$ bundle install
```
3. Create a branch for your changes
```shell
$ git checkout -b my_bug_fix
```
4. Make any changes
5. Write tests to support those changes.
6. Run the tests:
  * `bundle exec rake spec`
7. Assuming the tests pass, open a Pull Request on Github.

# Using Rakefile Commands
This repository comes with two Rake commands to assist in your testing of the code.

## `rake spec`
This command will run Rspec tests normally on your local system. Be careful that VCR will behave "weirdly" if you currently have the Docker daemon running.

## `rake quality`
This command runs a code quality threshold checker to hinder bad code.
