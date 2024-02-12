# server.rb

gem 'grpc', 1.5.0

require 'grpc'

class GreeterServer < Hello::Greeter::Service
  def say_hello(request, _call)
    Hello::HelloReply.new(message: "Hello, #{request.name}!")
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('localhost:50051', :this_port_is_insecure)
server.handle(GreeterServer)
server.run_till_terminated

