module Rectangle where

import PointsForRendering
import Graphics.Rendering.OpenGL 
{-
drawSquare :: [(GLfloat,GLfloat,GLfloat)] -> IO ()
drawSquare points  = 
	displayPoints points LineLoop
-}

square :: GLfloat ->  [(GLfloat,GLfloat,GLfloat)]
square width = rectangle width width 

rectangle :: GLfloat -> GLfloat -> [(GLfloat,GLfloat,GLfloat)]
rectangle width height = [(w,h,0),(w,-h,0),(-w,-h,0),(-w,h,0)]
	where 
		w = width / 2
		h = height / 2
