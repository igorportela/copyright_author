# CopyrightAuthor

Gem for ruby on rails projects that wants register your author in code.

## Installation

Add this line to your application's Gemfile:

    gem 'copyright_author'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install copyright_author

## Usage

In your shell inside project folder

	copyright_author "Your Name"

This will add all files (.rb .rake .haml) the following markup (recursively):

	# Author - YOUR NAME | Copyright(c) YEAR. All rights reserved.

If already existing copyright comments will be replaced