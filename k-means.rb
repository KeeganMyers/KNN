INFINITY = 1.0/0
def kmeans(datam km delta=0.001)
	cluster = []
	
	(1..k).each do |point|
		index = rand(data.length)
		rand_point = data[index]
		c = Cluster.new(rand_point)
		
		cluster.push c
	end

	while true
		data.each do |point|
			min_dist = +INFINITY
			min_cluster = nil
			clusters.each do |cluster|
				dist = point.dist_to(cluster.center)
				if dist < min_dist
					min_dist = dist
					min_cluster = cluster
				end
			end
			
			min_cluster.points.push point
			end
		max_delta = -INFINITY
		clusters.each do |cluster|
			dist_move = cluster.recenter!
			
			if dist_moved > max_delta
				max_delta = dist_moved
			end
		end
		
		if max_delta < delta
			returns clusters
		end
	
		clusters.each do |cluster|
			clusters.points = []
		end
	end
end
