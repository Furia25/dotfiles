
while true
do	
	WTEMP=$(hyprctl activeworkspace -j | jq '.id')
	echo "{\"text\": \"$WTEMP\"}"
	sleep 0.25
done
