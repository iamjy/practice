
SAMA5D4 Xplained Board - USB camera(CAM8200-U) with LCD interface

---------------------------------------------------------------

1.	Make sure of the Hardware connections	
2. 	SAMA5D4 Xplained board is booted by a SD card.
3.	Compile kernel source and replace zImage and DTB file in Boot partition of SD card
4.	Copy luvc_test binary file into root partition of SD card 
5.	if you are using 7 inch display, make sure you are using an external power supply, donot use the power from board
6. 	If permission denied to execute the executables file then change the permission using below command
      	# chmod 777 luvc_test

7. 	for LCD display configuratrion please use below user guide.

	http://www.element14.com/community/docs/DOC-68484#cdocuments


---------------------------------------------------------------
