module PointsForRendering (
		renderInWindow,
		displayPoints,
		mainFor,
		displayMyPoints,
		myPoints,
		makeVertexes,
		displayPointsAt)where
import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL

mainFor :: PrimitiveMode -> IO () 
mainFor primitiveShape 
	= renderInWindow (displayMyPoints primitiveShape)

renderInWindow :: IO () -> IO ()
renderInWindow displayFunction = do
	(progName,_) <- getArgsAndInitialize
	createWindow progName
	windowSize $= Size 800 600
	displayCallback $= displayFunction
	mainLoop

displayMyPoints :: PrimitiveMode -> IO ()
displayMyPoints primitiveShape  = do
	
	clear [ColorBuffer]
	currentColor $= Color4 1 1 0 1
	displayPoints myPoints primitiveShape

displayPoints :: [(GLfloat,GLfloat,GLfloat)] -> PrimitiveMode -> IO ()
displayPoints points primitiveShape = do
	--loadIdentity
	renderAs primitiveShape points
	
	flush

renderAs :: PrimitiveMode -> [(GLfloat,GLfloat,GLfloat)] -> IO ()
renderAs figure ps = renderPrimitive figure$makeVertexes ps

makeVertexes :: [(GLfloat,GLfloat,GLfloat)] -> IO ()
makeVertexes = mapM_ (\(x,y,z) -> vertex$Vertex3 x y z)

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints = [ (sin (2*pi*k/100),cos (2*pi*k/100),0::GLfloat) | k<-[1..100]]

displayPointsAt  :: [(GLfloat,GLfloat,GLfloat)] -> GLfloat -> GLfloat -> PrimitiveMode -> IO ()
displayPointsAt points x y primitiveShape = do
	
	translate $Vector3 x y (0::GLfloat)
	displayPoints points primitiveShape
	loadIdentity
	flush
 