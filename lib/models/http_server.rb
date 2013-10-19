require 'socket'



class HTTPServer

  attr_reader :server

  def initialize(port)
    @server = TCPServer.new(port)
    @on = true
    accept_requests
  end

  def on?
    @on
  end

  def accept_requests
    while self.on?
      session = self.server.accept
      Thread.new do
        HTTPWorker.new(session)
      end.join
    end
  end

end

class HTTPWorker

  HTTP_VERSION = "HTTP/1.1"
  CODE_200     = "200 OK"
  CODE_404     = "404 Page Not Found"
  CODE_500     = "500 Internal Server Error"
  CONTENT_TYPE = "Content-Type: text/html; charset=utf-8"
  LINE_BREAK   = "\r\n"

  attr_reader :session
  attr_accessor :path, :http_verb, :http_version

  def initialize(session)
    @session = session
    process_request
    session.close
  end

  def process_request
    session.gets
    request_ok
  end

  def is_supported_http_verb?
    
  end

  def parse_request_line(line)
    self.path, self.http_verb, self.http_version = line.split(' ')
  end

  def send_response(code, body)
    session.print("#{HTTP_VERSION} #{code}#{LINE_BREAK*2}#{body}")
  end

  def request_ok
    send_response(CODE_200, "<h1>Success</h1>")
  end

  def page_not_found
    send_response(CODE_404, "<h1>Page Not Found</h1>")
  end

  def server_error
    send_response(CODE_500, "<h1>Internal Server Error</h1>")
  end

end


