class LogLineParser
  LOG_FORMAT = /\A\[(?<log_level>\w+)\]:\s?(?<message>.*)\z/

  attr_reader :log_level, :message

  def initialize(line)
    @line      = line.strip.match(LOG_FORMAT)
    @log_level = @line[:log_level].strip.downcase
    @message   = @line[:message].strip
  end

  def reformat = "#{message} (#{log_level})"
end
