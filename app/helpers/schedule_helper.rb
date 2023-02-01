# frozen_string_literal: true

module ScheduleHelper
  def convert_to_local_time(time)
    time.change(offset: '+0500')
  end
end
