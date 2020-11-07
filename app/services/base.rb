class Base
  def initialize
    @data = {}
    @errors = []
  end

  def call
    begin
      perform
    rescue StandardError => e
      @errors << e
    end

    log_errors if @errors.present?
    Result.new(data: @data, errors: @errors)
  end

  private

  def log_errors
    Rails.logger.info @errors
  end
end
