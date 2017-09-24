require './data_structures/priority_queue.rb'

# Definition for an interval.
class Interval
    attr_accessor :start, :end
    def initialize(s=0, e=0)
        @start = s
        @end = e
    end
end

def min_meeting_rooms(intervals)
  intervals.sort_by! { |interval| interval.start } # nlogn
  current_meetings = PriorityQueue.new
  max_meetings = 0
  num_current_meetings = 0
  puts "++++++++++++++++++++++++++++++++++++++++++++++++"
  intervals.each do |interval|
    puts "_____________________________________"
    current_meetings.peek.nil? ? puts("none") : puts("Queue: #{current_meetings.print_all}")
    puts "interval: #{[interval.start, interval.end]}"
    if current_meetings.peek.nil? or interval.start < current_meetings.peek.value
      # we'll need a new room
      puts "# we'll need a new room"
    else
      # Some room is free, yay!
      puts "# Some room is free, yay!"
      while current_meetings.peek and current_meetings.peek.value <= interval.start
        current_meetings.remove
      end
    end
    current_meetings.add(interval.end, interval.end)
    max_meetings = current_meetings.length if current_meetings.length >= max_meetings
    puts "max meetings: #{max_meetings}"
    current_meetings.peek.nil? ? puts("none") : puts("Queue: #{current_meetings.print_all}")
  end

  return max_meetings
end

a = [[7,10],[2,4]]
b = [[10,20],[30,60],[35,50],[50,60],[100,200],[120, 170],[140,150],[150,190],[160,200],[180,240],[210,260],[230,260]]
a.map! { |interval| Interval.new(interval.first, interval.last) }
b.map! { |interval| Interval.new(interval.first, interval.last) }

puts min_meeting_rooms(a) == 1
puts min_meeting_rooms(b) == 4
