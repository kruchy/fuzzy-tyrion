module Circle where

import PointsForRendering
import Graphics.Rendering.OpenGL 
--import Graphics.UI.GLUT

circlePoints :: GLfloat -> GLfloat -> [(GLfloat,GLfloat,GLfloat)] 
circlePoints radius number =
	[let alpha = 2*pi*i/number 
	in (radius*sin(alpha),radius*cos(alpha),0) | i <- [1,2..number] ]

circle :: GLfloat -> [(GLfloat,GLfloat,GLfloat)]
circle radius = circlePoints radius 100

renderCircleApprox :: GLfloat -> GLfloat -> IO ()
renderCircleApprox r n = 
	displayPoints (circlePoints r n) LineLoop

renderCircle :: GLfloat -> IO () 
renderCircle r = 
	displayPoints (circle r) LineLoop

circleAt :: GLfloat -> GLfloat -> GLfloat ->  IO ()
circleAt x y radius = do
	translate$Vector3 x y (0::GLfloat)
	renderCircle radius