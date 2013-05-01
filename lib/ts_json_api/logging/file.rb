module TsJsonApi
  module Logging
    class File

      attr_reader :path, :options

      def initialize(options={})

        @options = options
        @url = options[:url]

        relative_path = options[:relative_path] || ''
        if relative_path.blank? 
          @path = options[:path] unless options[:path].blank?
        else
          unless relative_path.end_with? '.log'

            relative_path.gsub! ".log", ''
            if Configure.timestamped_logs?
              relative_path << "_t#{Time.now.to_i}.log"
            else
              relative_path << ".log"
            end

          end

          @path = Configure::LOG_FILE_DIRECTORY.join(relative_path)
        end

        raise ArgumentError, 'need help finding a path!' if @path.blank?

      end

      def write(content)
        raise 'Cannot write to log file if opened as readonly' if @options[:readonly]
        create_dir_if_not_exists
        ::File.open(@path, 'w') { |f| f.write content_string(content) }
      end

      def contents
        raise 'Only available when reading a file' unless @options[:readonly]
        json = JSON.parse(IO.read path).symbolize_keys
        json[:content] = JSON.parse(json[:content])
        json
      end

      private

      def content_string(str)
        { time: Time.now, url: options[:url], content: str }.to_json
      end

      def create_dir_if_not_exists
        dir = ::File.dirname(path)
        FileUtils.mkpath dir unless Dir.exists?(dir)
      end

    end
  end
end
