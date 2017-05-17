project (conditon)
cmake_minimum_required (VERSION 2.6)

add_custom_target (print-city ALL
	COMMAND echo "Vancouver is a nice city"
	COMMAND echo "Even when it rains")

add_custom_target (print-time
	COMMAND echo "It is now 2:17pm")

add_custom_target (print-day
	COMMAND echo "Today is Monday")

add_dependencies (print-city print-time print-day)

