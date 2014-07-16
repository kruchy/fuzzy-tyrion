{-# LANGUAGE TemplateHaskell #-}

import Control.Lens 
import Math.NURBS
import Math.Spline.Knots 
import Math.Spline.BSpline.Reference
import Math.Spline.BezierCurve
import Math.Spline.Hermite
import Math.Spline.Class
import Math.Spline.MSpline
import Math.Spline.ISpline
import Data.Vector

data Point2K a = Point2K 
				{_x :: Knots a
				,_y :: Knots a} 

makeLenses ''Point2K

instance Show a => Point2K a where
	show _x = print _x 




main = do
	let p = Point2K (knot 4) (knot 2)
	print $ p^.x
	print $ p^.y
