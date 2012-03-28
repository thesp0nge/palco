# Palco API

## Introduction

In the lib directory you can find Palco API organized as follow:
* Palco::Base is the core API making all the work behind the scenes. In the
  binary script it's used directly for destroying purposes since it doesn't
  matter if we're talking about an extension or an application.
* Palco::Extension is a Palco::Base subclass dedicated to create Sinatra
  extension with a filesystem scheme described
  [here](http://www.sinatrarb.com/extensions.html). A gemspec file is also
  provided if you want to pack you extension as a ruby gem.
* Palco::Application is the Palco::Base subclass dedicated to create Sinatra
  application skeletons. Please note that I like most 
  [Sinatra Modular approach](http://www.sinatrarb.com/intro#Modular%20vs.%20Classic%20Style) so I
  create the app this way with a config.ru but you can easly change it if you
  want to serve your app in a classic style.

## Palco::Base API

### Creating a new palco
Creating a new _palco_ object it's easy. You just need a name and a list of
files or directories you want in the main dir. 

You can extending Palco::Base to create layout even for non Sinatra application
but it's off topic here.

```
require 'palco'

base = Palco::Base.new('test_one',[{:name=>'README', :file=>true}, {:name=>'lib', :file=>false}]
``` 

Creating a new object this way you don't have a skeleton directory yet created
for you. You must call generate method to get the job done.

From now, you want a generic stage (it doesn't matter if for a Sinatra
application or your markdown based ebook you'r launching so far) called
**test_one** and in that named root directory you want a file named _README_
and an empty directory called _lib_.

Let's build the directories calling generate method.

``` 
if base.generate
  puts "success"
else
  puts "failure"
end
```

It returns a boolean telling if building was successful or not, so you can make
your own decision about it.


### Destroy a palco

You don't need your **test_one** stage anymore? It's easy to ask APIs to
destroy it using the destroy method.

```
if base.destroy
  puts "success"
else
  puts "failure"
end
```

Also the destroy methods return a boolean with the easy to guess meaning that
the stage has been destroyed or not.

You can also destroying a previously genereated stage with the following:

```
require 'palco'

base = Palco::Base.new('test_two')
base.destroy
```

Note here that we didn't pass any file list to Palco::Base contructor. The code
initializes the parameter to an empty array if no argument is provided.

```
def initialize(name=nil, items_list=[])
      @project_name = name
      @items_list = items_list
      @generated = false

      if @project_name.nil? or @items_list.size==0
        @valid = false
      else
        @valid = true
      end
    end
```

This way since I'm not interesting in generating files or directories I can let
my item lists array to be empty.
