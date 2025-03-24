#holds x and y node values and the current piece placement
class Node
    attr_accessor :x_axis, :y_axis, :piece, :connections

    def initialize(x_axis,y_axis)
        @x_axis = x_axis
        @y_axis = y_axis
        @piece = nil
        @connections = []
    end

    def to_s
        "(#{@x_axis}, #{@y_axis})"
    end

end
