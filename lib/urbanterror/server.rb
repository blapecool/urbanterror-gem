require 'socket'
require 'pp'

module UrbanTerror
  class Server
    attr_reader :players, :settings, :last_status
    attr_writer :rcon_password

    def initialize(server, port=27960, rcon_password='', timeout=3)
      @server = server
      @port = port
      @rcon_password = rcon_password
      @timeout = timeout

      @socket = UDPSocket.open
      @socket.connect(server, port)
    end

    def update_status
      @last_status = send_command("getstatus")

      if @last_status == false
        # Build the settings hash
        result = get_status_parts(1).split("\\").reject(&:empty?)
        @settings = Hash[*result]

        # Build the player list
        @players = []
        results = get_status_parts(2..-1)
        results.map do |player|
          player = player.split(" ", 3)
          @players << { :name => player[2][1..-2], :ping => player[1].to_i, :score => player[0].to_i }
        end
      end

      return @last_status
    end

    def get(command)
      send_command("get#{command}")
    end

    def rcon(command, wait_after_command=false)
      fail "No rcon password given" if @rcon_password == ''

      output = send_command("rcon #{@rcon_password} #{command}")
      sleep 0.300 if wait_after_command

      return output
    end

    def get_status_parts(i)
      @last_status.split("\n")[i]
    end

    private
    def send_command(command)
      magic = "\377\377\377\377"
      @socket.send("#{magic}#{command}\n", 0)

      res = IO::select([socket], nil, nil, @timeout)
      return false if res.nil?

      @socket.recv(2048)
    end
  end
end
