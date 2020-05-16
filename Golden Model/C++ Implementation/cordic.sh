#! /bin/bash
#
cp cordic.hpp /$HOME/include
#
g++ -c -Wall -I /$HOME/include cordic.cpp
if [ $? -ne 0 ]; then
  echo "Compile error."
  exit
fi
#
mv cordic.o ~/libcpp/cordic.o
#
echo "Normal end of execution."
