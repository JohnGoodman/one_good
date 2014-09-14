module ApplicationHelper
	def display_date(date)
    return date unless date.kind_of?(Date) || date.kind_of?(Time)

    date.in_time_zone('Central Time (US & Canada)').strftime( '%b, %d' )
  end
end
