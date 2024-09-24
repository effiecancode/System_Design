from socketserver import TCPServer, StreamRequestHandler

class EchoHandler(StreamRequestHandler):
    def handle(self):
        message = self.rfile.readline().decode()
        print(f'Recieved: {message}')
        self.wfile.write(message.encode())

with TCPServer(("", 8000), EchoHandler) as server:
    print("Server running on port 8000..")
    server.serve_forever()

# module for handling multiple client connections concurrently
# The code creates a simple TCP server that can handle multiple connections simulteneously