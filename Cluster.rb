class Cluster
atter_accessor :center, :points

def initialize(center)
	@center = center
	@points = []
end

def recenter!
	xa=ya=0
	old_center=@center
	@points.each do |point| 
		xa+=point.x
	        ya+=point.y
	end
	xa/=points.length
	ya/=points.length
	
	@center= Point.new(xa,ya)
	return old_center.dist_to(center)
end
end
