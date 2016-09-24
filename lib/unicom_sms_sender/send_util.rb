require "base64"
require "erb"
require 'mechanize'
module UnicomSmsSender
  class SendUtil
    attr_reader :app_name, :message_type, :phone, :content

    class << self
      def [](app_name, message_type, phone, content)
        SendUtil.new(app_name, message_type, phone, content)
      end
    end

    def initialize(app_name, message_type, phone, content)
      @app_name = app_name
      @message_type = message_type
      @phone = phone
      @content = content
    end

    def send
      p send_sms(phone, content)
    end

    private
    def configuration
      UnicomSmsSender.configuration
    end

    def send_sms(phone, message)
      service_id = configuration.send_service_id
      send_key = configuration.send_send_key
      cp_id = configuration.send_cpid
      url = configuration.send_send_url

      sign = Digest::MD5.hexdigest("#{cp_id}#{send_key}")
      message = Base64.strict_encode64(message)
      agent = Mechanize.new
      page = agent.post(url, {
          "mobi" => phone,
          "msg" => message,
          "sign" => sign,
          "sid" => service_id,
      })
      page.body.to_s
    end
  end

end