# client.rb

gem 'grpc', 1.5.0

require 'grpc'

stub = Hello::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)

request = Hello::HelloRequest.new(name: 'John')
response = stub.say_hello(request)

puts "Received from server: #{response.message}"

