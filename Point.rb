class Point 
attr_accessor :x,:y

def initialize(x,y)
	@x=x
	@y=y
end

def dist_to(p)
	xs = (@x - p.x)**2
	ys = (@y - p.y)**2
	return Math::sqrt(xs +ys)
end

def to_s
	return "(#{@x}, #{@y})"
end
end
