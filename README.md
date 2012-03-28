# Palco

## Introduction

Palco is the Italian word means stage and it's supposed to be a
[Sinatra](http://sinatrarb.com) based application skelethon generator.

The idea is just to have a basic script to automate what I did everytime I need
to start a new Sinatra project.
Nothing but a simple template creator for my pourposes... opensourced just in
case someelse need it.

## Installation

To install palco you can use gem command to fetch the code from
[rubygems](http://rubygems.org).

``` 
gem install palco
```

This way you have a script named palco you can use it to barely generate your
Sinatra application skelethon.

## Usage

Using palco to generate [Sinatra extensions](http://www.sinatrarb.com/extensions.html):

```
palco -e my_great_extention
```

You can also create a Sinatra basic application skeleton in order to fire
rackup and start working:

```
palco -a my_app
```

And if you don't like your work... just destroy it (even a rm command is working here):

``` 
palco -D my_app
```

