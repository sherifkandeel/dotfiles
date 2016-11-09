clear
prev_track=""
while true
do 
    track_name=`./get_song.script`
    artist_name=`./get_artist.script`
    if [ "$prev_track" != "$track_name" ]; then
	clear
	curl --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=$artist_name" --data-urlencode "title=$track_name"
    fi
    prev_track=$track_name
    sleep 5
done
