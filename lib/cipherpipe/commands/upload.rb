class Cipherpipe::Commands::Upload
  def self.call(configuration = nil)
    new(configuration).call
  end

  def initialize(configuration)
    @configuration = configuration
  end

  def call
    configuration.external_sources.each do |source|
      puts "Uploading to #{source.type}"
      source.upload configuration.variables
    end
  end

  private

  def configuration
    @configuration ||= Cipherpipe::Configuration.new
  end
end
