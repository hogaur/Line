require 'rspec/core/rake_task'
require './lib/line'
RSpec::Core::RakeTask.new(:spec)

#task :run, [:arg1, :arg2] do |t, args|
#  l=Line.new(#{args.param1},#{args.param2}).length
#  puts "length of given line is"+ "#{l}"
#end

task :run, [:arg1,:arg2,:arg3,:arg4] do |t, args|
  p1=["#{args[:arg1]}".to_i,"#{args[:arg2]}".to_i]
  p2=["#{args[:arg3]}".to_i,"#{args[:arg4]}".to_i]
  l=Line.new(p1,p2).length
  puts "#{l}"
end
