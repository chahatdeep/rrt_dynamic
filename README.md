# RRT Smart Algorithm for a _finite_ volume robot:
This is an RRT demonstartion for a finite volume robot with kinodynamic constraints.

## Rapidly-Exploring Random Tree

#### Author: Chahat Deep Singh
#### April 25 2017
#### University of Maryland College Park
 -----------------------------------
 
Instructions:
============
 - Run the file RunMe.m in Matlab (R2009b+)
 - Make sure the files:
 	(a). CollisionFree
 	(b). H5_robot.txt
 	(c). Near
 	(d). Nearest
 	(e). ObstacleFree
 	(f). RRTs
 	(g). Steer
 	(h). Steer2
  (i). circle
  (j). circleExtrude
  (k) confun
  (l) mat_file_cal (Not required by RunMe; Needed for CSV file generation)
  (m) plotObstacle
  (n) plotObstacleExtrude
  (o) robot
 	are in the same folder.

- mat_file_cal creates CSV files which contains the time, position (x,y), theta, velocity, omega, acceleration and gamma (steer acc) in the respective order.

Input Arguments:
================
- xdim, ydim : Size of the grid
- Start Node: start_node [x y]
- Target: goal [x y]
- radius: Radius of the End Goal region
- r: radius of the obstacles
- Epsilon: Minimum Step size for the RRT
- [Change the input data here](RunMe.m)


Sample Outputs
=======
- [Output 1](Output/1.jpg)
- [Output 2](Output/2.jpg)
- [Output 3](Output/3.jpg)
- [Output 4](Output/4.jpg)
- [Output 5](Output/5.jpg)

Sample CSV Files
=======
- [CSV 1](CSV_files/Problem1.csv)
- [CSV 2](CSV_files/Problem2.csv)
- [CSV 3](CSV_files/Problem3.csv)
- [CSV 4](CSV_files/Problem4.csv)
- [CSV 5](CSV_files/Problem5.csv)

Requirements
============
- Matlab R2009b or later.

Notes
=======
- Tested on MATLAB R2016b, Arch Linux 2017.03.01, Kernel: 4.9.11
