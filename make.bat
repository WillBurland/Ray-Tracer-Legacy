@echo off

set showDebugCmd=1

cd build
del RayTracer-x64.exe
del output.bmp

cls

echo Building...

if %showDebugCmd%==0 (
	g++ -std=c++17 -O2 ^
	../src/main.cpp ^
	../src/bitmap_io.cpp ^
	../src/camera.cpp ^
	../src/colour.cpp ^
	../src/hittable_object_list.cpp ^
	../src/ray.cpp ^
	../src/sphere.cpp ^
	../src/vec3.cpp ^
	-o RayTracer-x64.exe ^
	-mwindows
)

if %showDebugCmd%==1 (
	g++ -std=c++17 -O2 ^
	../src/main.cpp ^
	../src/bitmap_io.cpp ^
	../src/colour.cpp ^
	../src/camera.cpp ^
	../src/hittable_object_list.cpp ^
	../src/ray.cpp ^
	../src/sphere.cpp ^
	../src/vec3.cpp ^
	-o RayTracer-x64.exe ^
	-g -Wall
)

echo Done
echo.

if exist RayTracer-x64.exe (
	RayTracer-x64.exe
	output.bmp
)

cd ../