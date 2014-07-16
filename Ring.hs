module Ring where

import Circle
import PointsForRendering
import Graphics.Rendering.OpenGL

ringPoints :: GLfloat -> GLfloat -> [(GLfloat,GLfloat,GLfloat)]
ringPoints inner outer =
	concat $map (\(x,y) -> [x,y]) $points ++ [p]
	where
		points@(p:_) = zip innerPoints outerPoints
		innerPoints = circle inner
		outerPoints = circle outer

ring :: GLfloat -> GLfloat -> IO ()
ring innerRadius outerRadius =
	displayPoints (ringPoints innerRadius outerRadius) QuadStrip

ringAt :: GLfloat -> GLfloat -> GLfloat -> GLfloat -> IO () 
ringAt x y innerRadius outerRadius = do
  translate$Vector3 x y (0::GLfloat)
  ring innerRadius outerRadius