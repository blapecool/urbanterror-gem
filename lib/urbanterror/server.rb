require 'socket'
require 'pp'

module UrbanTerror
  class Server
    def initialize(server, port=nil, rcon=nil)
      @server = server
      @port = port || 27960
      @rcon = rcon || ''
      @socket = UDPSocket.open
      @last_status = ''
    end

    def update_status
      @last_status = send_command("getstatus")
    end

    def get(command)
      send_command("get#{command}")
    end

    def rcon(command)
      send_command("rcon #{@rcon} #{command}")
    end

    # settings() returns a hash of settings => values.
    # We /were/ going to accept an optional setting arg, but it would be
    # doing the same thing and just selecting one from the Hash, so
    # why not just let the user do server.settings['map'] or whatever.
    def settings
      result = get_status_parts(1).split("\\").reject(&:empty?)
      Hash[*result]
    end
    
    # players() returns a list of hashes. Each hash contains
    # name, score, ping.
    def players
      results = get_status_parts( 2..-1)
      results.map do |player|
        player = player.split(" ", 3)
        {
          :name => player[2][1..-2],
          :ping => player[1].to_i,
          :score => player[0].to_i
        }
      end
    end

    def get_status_parts(i)
      @last_status.split("\n")[i]
    end

    private
    def send_command(command)
      magic = "\377\377\377\377"
      @socket.send("#{magic}#{command}\n", 0, @server, @port)
      @socket.recv(2048)
    end
  end
end
