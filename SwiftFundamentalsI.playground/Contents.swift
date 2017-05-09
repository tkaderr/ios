var type: String = "Rectangle"
var description: String = "A quadrilateral with four right angles"

var width: Double = 5
var height: Double = 10.5
var area = Double(width) * height

print(width)
height += 1
print(height)
width += 1

area = Double(width) * height
// Note how you can "interpolate" variables into Strings using the following syntax
print("The shape is a \(type) or \(description) with an area of \(area)")
