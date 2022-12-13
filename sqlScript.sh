#!/usr/bin/bash

startDateTime="2023-01-01 06:29:26"
endDateTime="2023-03-01 06:29:26"
START=1
END=10
count=0

#Script to run automated sql queries 
#Here i is number of user lessons informatin that will be generayed
for (( c=$START; c<=$END; c++ ))
do	
	#Prepare sql query
	userId=$(( $RANDOM % 3 + 1 )) #here database has three userid and the dummy data assigned to this user randomly 
	cDate=$(date '+%Y-%m-%d %H:%M:%S')
	UUID=$(uuidgen)
	stop_flg=0
	delete_flg=0
  	#Date increments by One day
	startDateTime=$(date '+%Y-%m-%d %H:%M:%S' -d "$startDateTime next day"); 
	endDateTime=$(date '+%Y-%m-%d %H:%M:%S' -d "$endDateTime next day"); 
	note="Lorem Ipsum is simply dummy text of the printing and typesetting for learner ${i}"
	approval_flg=0
	delete_flg=0
	((count++)) 
	
	#mysql DB connection 
	./mysql.config <<EOF
	
	#sql query
	INSERT INTO user_lessons VALUES($userId, "${i}", "${cDate}", "${UUID}", "${UUID}", $stop_flg, $delete_flg, 
		  "${startDateTime}", "${endDateTime}", "${note}", $approval_flg, $cancel_flg)	       
EOF
done
echo "${count} Dummy Data Created"
echo "End of script"
