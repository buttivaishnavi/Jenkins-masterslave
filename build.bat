@echo off
echo ==== Compiling Java files ====
javac *.java
if %errorlevel% neq 0 (
    echo Build failed
    exit /b %errorlevel%
)

echo ==== Running Student.java ====
if not exist out mkdir out
java Student > out\artifact.txt

echo Build and run completed. Output stored in out\artifact.txt
