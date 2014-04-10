require 'csv'
require 'rubygems'
require 'gnuplot'

if __FILE__ == $0
	data = []
	fn = ''

if ARGV.length ==1
	fn = ARGV[0]
else
	puts 'Usage: kmeans.rb INPUT-FILE'
	exit
end

CSV.foreach(fn) do |row|
	x = row[0].to_f
	y = row[1].to_f
	
	p = Point.new(x,y)
	data.push p
end

puts 'Number of Cluster to find:'
k = STDIN.get.chomp!.to_i

clusters = kmean(data,k)

Gnuplot.open do |gp|
	Gnuplot::Plot.new(gp) do |plot|
		plot.title fn
		
		clusters.each do |cluster|
			x = cluster.points.collect{|p| p.x}
			y = cluster.points.collect{|p| p.y}
			
			plot.data << Gnuplot::DataSet.new([x,y]) do |ds|
				ds.notitle
			end
		end
	end
 end
end
