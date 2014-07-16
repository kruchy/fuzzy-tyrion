import PointsForRendering
import Graphics.Rendering.OpenGL
import Circle
import Ring 
import Rectangle 
main :: IO ()
main = renderInWindow display


display :: IO () 
display = do
	clearColor $= Color4 0 0 0 0
  	clear [ColorBuffer]
	--lineStipple $= Just (4,241)
	--rect (Vertex2 0.2::GLfloat 0.2::GLfloat) (Vertex2 0.2::GLfloat 0.2::GLfloat)
	{-loadIdentity
	circleAt 0.2 0.3 0.5
	loadIdentity
	circleAt 0 0.5 0.1
	loadIdentity
	circleAt 0.3 0.85 0.1
	loadIdentity
	circleAt 0.125 0.15 0.1

	loadIdentity
	circleAt 0.1 0.2 0.1
	-}
	displayPoints (square 0.2) Quads
	displayPointsAt (square 0.2) 0.5 0.5 Quads
	displayPointsAt (square 0.2) (-0.5) (-0.5) Quads
	