require "unicom_sms_sender/version"

module UnicomSmsSender

  class << self
    def configuration
      @configuration ||= begin
        if defined? Rails
          config_file = Rails.root.join("config/unicom_sms_sender.yml")
          if (File.exist?(config_file))
            config = YAML.load(ERB.new(File.new(config_file).read).result)
            config = config[Rails.env] if defined? Rails
          end
        end
        OpenStruct.new(config || {send_service_id: "", send_send_key: "", send_cpid: "", send_send_url: ""})
      end
    end

    def configure
      yield(configuration)
    end
  end
end
