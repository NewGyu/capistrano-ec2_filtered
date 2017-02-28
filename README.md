# Capistrano::Ec2Filtered

Get IP addresses of AWS EC2 instances filtered.
This is inspired by [Capistrano::Ec2Tagged](https://github.com/a2ikm/capistrano-ec2_tagged).

## Requirements

* aws-sdk
* capistrano ~> 3.0

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-ec2_filterd'

And then execute:

    $ bundle

## Usage

### AWS credentials

See: http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Client.html

> Default credentials are loaded automatically from the following locations:
> 
> * ENV['AWS_ACCESS_KEY_ID'] and ENV['AWS_SECRET_ACCESS_KEY']
> * Aws.config[:credentials]
> * The shared credentials ini file at ~/.aws/credentials (more information)
> * From an instance profile when running on EC2

The credentials must have `ec2:DescribeInstances` permission.

### Your Capfile

Add this line to your application's Capfile:

```ruby
require 'capistrano/ec2_filterd'
```

Then call `ec2_filterd` method in each stage files like config/deploy/production.rb as:

```ruby
role :web, ec2_filterd([{name: "tag:Name", values: ["my-web-server"]}])
role :app, ec2_filterd([{name: "tag:Name", values: ["my-app-server"]}])
role :db, ec2_filterd([{name: "tag:Name", values: ["my-db-server"]}])
```

Details of the filter expression is following link.

http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Client.html#describe_instances-instance_method
