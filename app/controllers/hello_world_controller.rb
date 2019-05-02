class HelloWorldController < ApplicationController
  def hello_world
    Pusher.trigger('my-channel', 'my-event', {
      message: 'hello world'
    })
  end
end
