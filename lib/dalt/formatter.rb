module Dalt
  # This class will handle all of date formatting
  class Formatter
    def initialize(date, options = {})
      @date = Date.parse(date.to_s)
      @options = options
    end

    def smart_change
      Parser.new(date_after_changed.to_s, alt: @options.fetch(:alt, smart_changing)).parse
    end

    private

    def date_after_changed
      return Date.civil year, month, -1 if end_of_month?

      Date.new year, month, day
    rescue ArgumentError
      nil
    end

    def day
      @day ||= @options.fetch(:day, @date.day)
    end

    def end_of_month
      Date.civil year, month, -1
    end

    def end_of_month?
      @date.month != @date.next_day.month
    end

    def month
      @month ||= @options.fetch(:month, @date.month)
    end

    def month_changed?
      @options.fetch(:month, false)
    end

    # Automatically assigned to max posibility of changes
    # Note: Order matter
    def smart_changing
      return smart_month_changing if month_changed?

      # means the only day will be change,
      # so we can just return max posibility of day which is end of month
      end_of_month
    end

    def smart_month_changing
      # When month is out of range, we automatically assign it to max poisibility of month,
      # which is december || 12
      new_date = if month > 12
                   Date.new year, 12
                 else
                   Date.new year, month
                 end

      new_end_of_month = Date.civil(new_date.year, new_date.month, -1)

      # its double check for day. If after we changed the day and day is out of range,
      # then we automatically assign it to max posibility of day which is end of month
      return new_end_of_month if new_end_of_month.day < day

      Date.new new_date.year, new_date.month, day
    end

    def year
      @year ||= @options.fetch(:year, @date.year)
    end
  end
end
