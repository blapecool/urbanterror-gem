require 'socket'
require 'pp'

module UrbanTerror
  class Server
    attr_reader :players, :settings, :last_status
    attr_writer :rcon_password

    def initialize(server, port=nil, rcon_password=nil)
      @server = server
      @port = port || 27960
      @rcon_password = rcon_password || ''
      @socket = UDPSocket.open
    end

    def update_status
      @last_status = send_command("getstatus")

      # Build the settings hash
      result = get_status_parts(1).split("\\").reject(&:empty?)
      @settings = Hash[*result]

      # Build the player list
      @players = []
      results = get_status_parts( 2..-1)
      results.map do |player|
        player = player.split(" ", 3)
        @players << { :name => player[2][1..-2], :ping => player[1].to_i, :score => player[0].to_i }
      end
    end

    def get(command)
      send_command("get#{command}")
    end

    def rcon(command)
      fail "No rcon password given" if @rcon_password == ''
      send_command("rcon #{@rcon_password} #{command}")
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
